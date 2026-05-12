import pandas as pd # Necesitarás instalarlo: pip install pandas
from datetime import datetime
import smtplib
from email.message import EmailMessage

def generar_resumen_diario():
    try:
        # Leer el log (asumiendo que tiene columnas: fecha, cpu, ram)
        df = pd.read_csv('log_consumo.csv', names=['fecha', 'cpu', 'ram'])

        # Filtrar solo los datos de hoy
        hoy = datetime.now().strftime("%Y-%m-%d")
        df_hoy = df[df['fecha'].str.contains(hoy)]

        promedio_cpu = df_hoy['cpu'].mean()
        promedio_ram = df_hoy['ram'].mean()
        max_cpu = df_hoy['cpu'].max()

        cuerpo = f"""
        Resumen de Consumo Diario ({hoy}):
        ----------------------------------
        Promedio CPU: {promedio_cpu:.2f}%
        Promedio RAM: {promedio_ram:.2f}%
        Pico máximo CPU: {max_cpu:.2f}%
        """

        # Reutiliza la lógica de enviar_correo aquí
        print(cuerpo) # Para pruebas
    except Exception as e:
        print(f"Error al procesar: {e}")

if __name__ == "__main__":
    generar_resumen_diario()