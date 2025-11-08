# 🚀 Primeros Pasos con Agente Manuelita

Guía rápida para empezar a usar el nuevo repositorio `agente_manuelita`.

## ✅ Verificación Inicial

El repositorio ha sido creado exitosamente en:
```
C:\Users\Esteban\Desktop\PROYECTO WEBSCRAPING\manuelita\agente_manuelita
```

## 📋 Checklist de Configuración

### 1. ✅ Estructura Creada

El proyecto tiene la siguiente estructura:

```
agente_manuelita/
├── src/
│   ├── agent/              ✅ Módulo del agente
│   ├── tools/              ✅ Herramientas
│   ├── utils/              ✅ Utilidades
│   └── config.py           ✅ Configuración
├── tests/                  ✅ Tests (vacío, listo para agregar)
├── data/                   ✅ Datos
├── configs/                ✅ Configuraciones
├── logs/                   ✅ Logs
├── vectordb/               ✅ Base vectorial
├── .streamlit/             ✅ Config Streamlit
├── app.py                  ✅ Aplicación principal
├── README.md               ✅ Documentación
└── .git/                   ✅ Repositorio Git inicializado
```

### 2. 🔧 Configuración Pendiente

#### a) Copiar archivos `.env`

Si tienes un archivo `.env` configurado en el repositorio anterior:

```powershell
# Desde la raíz del nuevo repositorio
Copy-Item "..\Repositorio\Webscraping_manuelita1\agent-app\.env" ".\.env"
```

O crear uno nuevo basado en `.env.example`:

```powershell
Copy-Item ".env.example" ".env"
```

Luego editar `.env` con tus API keys:

```env
OPENAI_API_KEY=tu_api_key_aqui
# O
GOOGLE_API_KEY=tu_api_key_aqui
```

#### b) Copiar datos procesados

Si tienes datos en el repositorio anterior:

```powershell
# Copiar datos procesados para RAG
Copy-Item "..\Repositorio\Webscraping_manuelita1\data\raw\processed\*" ".\data\" -Recurse -Force
```

### 3. 🐍 Configurar Entorno Virtual

```powershell
# Crear entorno virtual
python -m venv .venv

# Activar
.venv\Scripts\activate

# Instalar dependencias
pip install -r requirements.txt
```

### 4. 🧪 Verificar Instalación

```powershell
# Probar que los imports funcionan
python -c "from src.agent import ManuelitaAgent; print('✅ Imports OK')"

# Ver configuración
python -c "from src.config import config; import json; print(json.dumps(config.to_dict(), indent=2))"
```

### 5. 🚀 Ejecutar la Aplicación

```powershell
streamlit run app.py
```

La app se abrirá en `http://localhost:8501`

## 🎯 Próximos Pasos

### Opción A: Usar datos existentes

Si ya tienes datos procesados y vectordb del repositorio anterior:

1. ✅ Copiar `.env` (ya hecho arriba)
2. ✅ Copiar `data/` (ya hecho arriba)
3. ✅ La vectordb ya está copiada
4. 🚀 Ejecutar: `streamlit run app.py`

### Opción B: Empezar desde cero

Si quieres regenerar todo:

1. ✅ Configurar `.env` con API keys
2. 📄 Agregar documentos markdown en `data/`
3. 🚀 Ejecutar app: `streamlit run app.py`
4. 🔄 Ir a Admin > Regenerar vectordb

## 📝 Tareas Comunes

### Agregar nuevos documentos

```powershell
# 1. Agregar archivos .md en data/
Copy-Item "nuevo_documento.md" ".\data\"

# 2. Regenerar vectordb
# Ve a la app > Admin > Regenerar vectordb
```

### Actualizar dependencias

```powershell
# Actualizar requirements
pip freeze > requirements.txt

# O actualizar pyproject.toml y sincronizar
pip install -e .
```

### Ejecutar tests (cuando los crees)

```powershell
pytest tests/
```

### Ver logs

```powershell
# Ver logs de la app
Get-Content logs\app.log -Tail 50

# Ver logs del agente
Get-Content logs\agent.log -Tail 50
```

## 🐛 Solución de Problemas

### Error: ModuleNotFoundError

```powershell
# Asegúrate de estar en la raíz del proyecto
cd "C:\Users\Esteban\Desktop\PROYECTO WEBSCRAPING\manuelita\agente_manuelita"

# Reinstalar
pip install -e .
```

### Error: No API key

Verifica que `.env` existe y tiene tu API key:

```powershell
Get-Content .env
```

### Error: No encuentra documentos

Verifica que `data/` tiene archivos:

```powershell
Get-ChildItem data\ -Recurse -File
```

### Error: Streamlit no arranca

```powershell
# Reinstalar Streamlit
pip install --upgrade streamlit

# Limpiar cache
streamlit cache clear
```

## 📚 Documentación

- **README.md**: Documentación completa del proyecto
- **MIGRATION_GUIDE.md**: Guía de migración desde el repo anterior
- **pyproject.toml**: Configuración de dependencias
- **.env.example**: Plantilla de variables de entorno

## 🎓 Recursos de Aprendizaje

### Estructura del Código

- `src/agent/agent.py`: Lógica principal del agente
- `src/agent/rag.py`: Sistema de búsqueda RAG
- `src/agent/memory.py`: Sistema de memoria conversacional
- `src/config.py`: Configuración centralizada
- `app.py`: Interfaz Streamlit

### Modificar el Comportamiento

Para cambiar modelos, temperatura, etc., edita `src/config.py`:

```python
class LLMConfig:
    model: str = "gpt-4o-mini"  # Cambiar modelo
    temperature: float = 0.05    # Ajustar creatividad
    top_k: int = 4              # Documentos RAG a recuperar
```

## ✨ Características Principales

1. **Multi-LLM**: OpenAI, Google Gemini, Ollama
2. **RAG**: Búsqueda semántica en documentos
3. **Memoria**: Contexto de conversaciones
4. **Enrutamiento**: Selección automática de herramientas
5. **Streaming**: Respuestas fluidas en tiempo real
6. **UI Corporativa**: Colores y diseño de Manuelita

## 🎉 ¡Listo para Empezar!

Tu repositorio está completamente configurado y listo para usar. 

Siguiente paso recomendado:

```powershell
# 1. Activar entorno
.venv\Scripts\activate

# 2. Ejecutar app
streamlit run app.py

# 3. Abrir en navegador: http://localhost:8501
```

---

**¿Necesitas ayuda?** Revisa README.md o MIGRATION_GUIDE.md
