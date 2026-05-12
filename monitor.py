import psutil
import requests
import os
from datetime import datetime

# --- CONFIGURACIÓN TELEGRAM ---
TOKEN = "8706013178:AAFU85V5Dzjvgz54E9i0D8amTjLHJUfpzO0"
CHAT_ID = "-5046390529"
UMBRAL_CPU = 80.0  # Mantenlo en 0.0 para probar ahora
UMBRAL_RAM = 85.0
LOG_FILE = "/root/server_monitor/log_consumo.csv"

def enviar_telegram(mensaje):
    try:
        url = f"https://api.telegram.org/bot{TOKEN}/sendMessage"
        data = {"chat_id": CHAT_ID, "text": mensaje}
        response = requests.post(url, data=data)
        if response.status_code == 200:
            print("✅ Mensaje enviado a Telegram.")
        else:
            print(f"❌ Error API Telegram: {response.status_code}")
    except Exception as e:
        print(f"❌ Error de conexión: {e}")

def monitorear():
    cpu = psutil.cpu_percent(interval=1)
    ram = psutil.virtual_memory().percent
    disco = psutil.disk_usage('/').percent
    fecha = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # Guardar en CSV
    if not os.path.exists(LOG_FILE):
        with open(LOG_FILE, 'w') as f:
            f.write("fecha,cpu,ram,disco\n")
    with open(LOG_FILE, 'a') as f:
        f.write(f"{fecha},{cpu},{ram},{disco}\n")

    # Alerta
    if cpu > UMBRAL_CPU or ram > UMBRAL_RAM:
        texto = f"⚠️ ALERTA SERVIDOR\n\nFecha: {fecha}\nCPU: {cpu}%\nRAM: {ram}%\nDisco: {disco}%"
        enviar_telegram(texto)

if __name__ == "__main__":
    monitorear()