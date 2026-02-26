# 🛠 MBADox - Windows Information Gathering PoC

Este script es una prueba de concepto (PoC) de un recolector de información para sistemas Windows escrito en Batch. Extrae artefactos del sistema, configuraciones de red y datos de hardware.

---

## 📋 Funcionalidades / Features:
- **Red/Network:** Extracción de IP pública, configuración completa de interfaces y tabla ARP.
- **WiFi:** Volcado de perfiles WiFi y claves almacenadas en texto claro (`key=clear`).
- **Hardware:** Detalles técnicos de CPU, RAM, BIOS, GPU y Placa Base.
- **Software:** Enumeración de programas instalados, procesos activos y persistencia.
- **Credenciales:** Extracción de credenciales guardadas en el sistema (`cmdkey`).

## 🚀 Uso / Usage (Spanish/English)

### 🇪🇸 Instrucciones:
1. **Ejecución:** Haz doble clic en `MBADox_v2.15.7.bat`.
2. **Privilegios:** Se recomienda **Ejecutar como administrador** para obtener todos los datos (especialmente contraseñas WiFi y detalles de hardware).
3. **Antivirus:** Al ser un script de recolección de datos, Windows Defender o SmartScreen podrían marcarlo como sospechoso. Si esto ocurre, selecciona *"Más información"* y luego *"Ejecutar de todas formas"*.
4. **Resultado:** Todos los datos se guardarán automáticamente en un archivo llamado `Data.txt` en tu **Escritorio**.

### 🇺🇸 Instructions:
1. **Execution:** Double-click `MBADox_v2.15.7.bat`.
2. **Privileges:** It is highly recommended to **Run as Administrator** to retrieve all data (especially WiFi passwords and deep hardware details).
3. **Antivirus/SmartScreen:** Since this is a data gathering script, Windows Defender might flag it. If prompted, click *"More info"* and then *"Run anyway"*.
4. **Output:** All collected information will be saved to a file named `Data.txt` on your **Desktop**.

---

## ⚠️ Disclaimer / Aviso Legal
Este proyecto fue desarrollado exclusivamente con fines educativos y de investigación en ciberseguridad. El autor no se hace responsable del mal uso de esta herramienta.

This project was developed for educational and ethical security research purposes only. The author is not responsible for any misuse of this tool.
