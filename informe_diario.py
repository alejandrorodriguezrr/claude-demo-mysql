import pandas as pd
import requests
from datetime import datetime
import os

# --- CONFIGURACIÓN ---
TOKEN = "8706013178:AAFU85V5Dzjvgz54E9i0D8amTjLHJUfpzO0"
CHAT_ID = "-5046390529"  # El ID del grupo que sacaste antes
LOG_FILE = "/root/server_monitor/log_consumo.csv"

def enviar_telegram(mensaje):
    try:
        url = f"https://api.telegram.org/bot{TOKEN}/sendMessage"
        payload = {
            "chat_id": CHAT_ID,
            "text": mensaje,
            "parse_mode": "Markdown"
        }
        response = requests.post(url, data=payload)
        if response.status_code == 200:
            print("✅ Informe enviado al grupo.")
        else:
            print(f"❌ Error API Telegram: {response.status_code}")
    except Exception as e:
        print(f"❌ Error de conexión: {e}")

def generar_informe():
    if not os.path.exists(LOG_FILE):
        print("El archivo de log no existe. Espera a que el monitor guarde datos.")
        return

    try:
        # Leer los datos
        df = pd.read_csv(LOG_FILE)

        # Filtrar datos de hoy
        hoy = datetime.now().strftime("%Y-%m-%d")
        df_hoy = df[df['fecha'].str.contains(hoy)].copy()

        if df_hoy.empty:
            enviar_telegram(f"📊 *Informe {hoy}*\nNo hay datos suficientes para generar el promedio hoy.")
            return

        # Cálculos
        promedio_cpu = df_hoy['cpu'].mean()
        promedio_ram = df_hoy['ram'].mean()
        ultimo_disco = df_hoy['disco'].iloc[-1]

        # Formatear mensaje
        mensaje = (
            f" *RESUMEN DIARIO DEL SERVIDOR*\n"
            f" *Fecha:* {hoy}\n"
            f"━━━━━━━━━━━━━━━━━━\n"
            f" *Media CPU:* {promedio_cpu:.2f}%\n"
            f" *Media RAM:* {promedio_ram:.2f}%\n"
            f" *Estado Disco:* {ultimo_disco}%\n"
            f"━━━━━━━━━━━━━━━━━━\n"
            f"✅ _Informe generado automáticamente_"
        )

        enviar_telegram(mensaje)

    except Exception as e:
        print(f"❌ Error al procesar el CSV: {e}")

if __name__ == "__main__":
    generar_informe()