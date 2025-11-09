# 🌿 Agente Manuelita - Asistente Inteligente

Asistente inteligente con memoria conversacional, enrutamiento dinámico y búsqueda RAG para la empresa Manuelita.

## 🎯 Características

- **Enrutamiento Inteligente**: Detecta automáticamente si usar RAG, herramientas estructuradas o memoria conversacional
- **Memoria Conversacional**: Mantiene contexto de múltiples conversaciones
- **Sistema RAG**: Búsqueda semántica en documentos corporativos con ChromaDB
- **Multi-LLM**: Soporte para OpenAI, Google Gemini y Ollama (local)
- **Interfaz Streamlit**: UI moderna y personalizable con colores corporativos
- **Streaming de Respuestas**: Experiencia de chat fluida con efectos visuales

## 📁 Estructura del Proyecto

```
agente_manuelita/
├── src/
│   ├── agent/              # Módulo principal del agente
│   │   ├── agent.py        # Clase ManuelitaAgent
│   │   ├── memory.py       # Sistema de memoria conversacional
│   │   └── rag.py          # Sistema RAG con ChromaDB
│   ├── tools/              # Herramientas del agente
│   │   ├── structured_tool.py
│   │   └── data/           # Datos estructurados (FAQ)
│   ├── utils/              # Utilidades
│   │   └── parser.py       # Parser de documentos
│   └── config.py           # Configuración centralizada
├── tests/                  # Pruebas unitarias
├── configs/                # Archivos de configuración
├── data/                   # Datos y documentos
├── logs/                   # Logs de la aplicación
├── vectordb/               # Base de datos vectorial (ChromaDB)
├── .streamlit/             # Configuración de Streamlit
├── app.py                  # Aplicación principal Streamlit
├── pyproject.toml          # Dependencias y configuración
├── requirements.txt        # Dependencias pip
├── .env.example            # Ejemplo de variables de entorno
└── README.md               # Este archivo
```

## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone <url-del-repo>
cd agente_manuelita
```

### 2. Crear entorno virtual

```bash
python -m venv .venv

# En Windows
.venv\Scripts\activate

# En Linux/Mac
source .venv/bin/activate
```

### 3. Instalar dependencias

```bash
pip install -r requirements.txt
```

O con uv (más rápido):

```bash
uv pip install -e .
```

### 4. Configurar variables de entorno

Copia `.env.example` a `.env` y configura tus API keys:

```bash
cp .env.example .env
```

Edita `.env`:

```env
# OpenAI (recomendado)
OPENAI_API_KEY=tu_api_key_aqui

# O Google Gemini (alternativa)
GOOGLE_API_KEY=tu_api_key_aqui

# O Ollama (local, sin API key necesaria)
OLLAMA_BASE_URL=http://localhost:11434

# LangSmith (opcional - para observabilidad)
LANGCHAIN_TRACING_V2=false
LANGCHAIN_API_KEY=
LANGCHAIN_PROJECT=manuelita-agent
```

## 🎮 Uso

### Ejecutar la aplicación Streamlit

```bash
streamlit run app.py
```

La aplicación se abrirá en `http://localhost:8501`

### Uso programático

```python
from src.agent import ManuelitaAgent

# Inicializar agente
agent = ManuelitaAgent(provider="OpenAI")

# Hacer una pregunta
resultado = agent.process("¿Cuál es la historia de Manuelita?")

print(f"Respuesta: {resultado['answer']}")
print(f"Tool usado: {resultado['tool_used']}")
print(f"Fuentes: {resultado['sources']}")
```

## 🧪 Testing

Ejecutar pruebas:

```bash
pytest tests/
```

Con cobertura:

```bash
pytest --cov=src tests/
```

## 🔧 Configuración

Edita `src/config.py` para personalizar:

- **Modelo LLM**: OpenAI, Google Gemini, o Ollama
- **Temperatura**: Control de creatividad del modelo
- **Parámetros RAG**: Top-k, tamaño de chunks
- **Memoria**: Límites de tokens y turnos
- **UI**: Títulos, colores, velocidad de streaming

## 🌐 Proveedores LLM Soportados

### OpenAI
```python
config.llm.provider = "OpenAI"
config.llm.model = "gpt-4o-mini"  # o gpt-4, gpt-4-turbo, o1, etc.
```

### Google Gemini
```python
config.llm.provider = "Google Gemini"
config.llm.model = "gemini-2.0-flash"  # o gemini-1.5-pro, etc.
```

### Ollama (Local)
```python
config.llm.provider = "Ollama"
config.llm.model = "qwen3:4b"  # o llama3, mistral, etc.
```

## 📊 Funcionalidades

### 1. Sistema RAG
- Búsqueda semántica en documentos corporativos
- Embeddings con sentence-transformers
- Base de datos vectorial ChromaDB
- Reranking con BM25

### 2. Memoria Conversacional
- Gestión de múltiples conversaciones
- Límites configurables de tokens
- FIFO automático
- Persistencia en sesión

### 3. Enrutamiento Dinámico
El agente decide automáticamente qué herramienta usar:
- **RAG**: Para preguntas generales sobre la empresa
- **Structured**: Para preguntas específicas de FAQ
- **Memory**: Para preguntas contextuales (nombres, referencias)

### 4. Interfaz Streamlit
- 3 páginas: FAQs, Admin, Chat
- Diseño corporativo personalizado
- Streaming de respuestas
- Gestión de conversaciones

## 🔒 Seguridad

- No expone prompts internos
- Sanitización de respuestas
- Validación de entrada
- Control de acceso a API keys

## 📝 Logs

Los logs se guardan en la carpeta `logs/`:

```
logs/
├── app.log
├── agent.log
└── rag.log
```

## 🤝 Contribuir

1. Fork el proyecto
2. Crea tu feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push al branch (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto es privado y propiedad de Manuelita.

## 👥 Autores

- **Esteban Arroyave López**
- **Manuel Luna Alegría** 

**Desarrollado con ❤️ pensando en Manuelita S.A., en el marco del curso Tecnicas avanzadas con LLM** 🌿
