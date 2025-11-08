# 📦 Guía de Migración

Guía para migrar desde el repositorio anterior (`Webscraping_manuelita1/agent-app`) al nuevo repositorio limpio `agente_manuelita`.

## 🎯 Cambios Principales

### Estructura de Carpetas

**Antes:**
```
agent-app/
├── agent.py
├── memory.py
├── rag.py
├── config.py
├── parser.py
├── app.py
├── tools/
└── vectordb/
```

**Después:**
```
agente_manuelita/
├── src/
│   ├── agent/
│   │   ├── agent.py
│   │   ├── memory.py
│   │   └── rag.py
│   ├── tools/
│   ├── utils/
│   │   └── parser.py
│   └── config.py
├── app.py
└── vectordb/
```

### Cambios en Imports

#### En `app.py`

**Antes:**
```python
from agent import ManuelitaAgent
from config import config, SAMPLE_FAQS
from memory import SessionManager
from parser import create_faq_json
```

**Después:**
```python
from src.agent import ManuelitaAgent
from src.config import config, SAMPLE_FAQS
from src.agent.memory import SessionManager
from src.utils.parser import create_faq_json
```

#### En módulos internos

**Antes (en agent.py):**
```python
from rag import RAGSystem
from tools.structured_tool import StructuredDataTool
from memory import ConversationMemory
from config import config
```

**Después:**
```python
from .rag import RAGSystem
from ..tools.structured_tool import StructuredDataTool
from .memory import ConversationMemory
from ..config import config
```

## 🔄 Pasos para Migración

### 1. Copiar datos personalizados

Si tienes datos personalizados en el repositorio anterior, cópialos:

```bash
# Copiar datos procesados
cp -r ../Webscraping_manuelita1/data/raw/processed/* ./data/

# Copiar configuración personalizada (SI LA TIENES)
cp ../Webscraping_manuelita1/agent-app/.env ./.env
```

### 2. Verificar imports

Si tienes scripts personalizados que importan el agente, actualiza los imports:

```python
# Antes
from agent import ManuelitaAgent

# Después
from src.agent import ManuelitaAgent
```

### 3. Actualizar rutas en configuración

Si modificaste rutas en `config.py`, verifica que apunten a las carpetas correctas:

```python
# En src/config.py
self.data_dir = "../data/raw/processed"  # Ruta relativa desde src/
self.vectordb_dir = "./vectordb"          # Desde raíz del proyecto
```

### 4. Reinstalar dependencias

```bash
# Activar entorno virtual
.venv\Scripts\activate  # Windows
source .venv/bin/activate  # Linux/Mac

# Instalar dependencias
pip install -r requirements.txt
```

### 5. Regenerar base vectorial (opcional)

Si quieres empezar desde cero:

```bash
# Eliminar base vectorial existente
rm -rf vectordb/

# Ejecutar la app y regenerar
streamlit run app.py
# Ve a Admin > Regenerar vectordb
```

## ⚠️ Puntos Importantes

### Rutas relativas

Los módulos ahora usan imports relativos (`.` y `..`) para mantener la estructura modular.

### Configuración de datos

Por defecto, el agente busca datos en:
- `../data/raw/processed` - Documentos para RAG
- `./vectordb` - Base de datos vectorial
- `src/tools/data/faq_structured.json` - FAQ estructurados

### Variables de entorno

Asegúrate de configurar tu archivo `.env` con las API keys necesarias:

```env
OPENAI_API_KEY=tu_key_aqui
# o
GOOGLE_API_KEY=tu_key_aqui
```

## 🐛 Problemas Comunes

### Error: ModuleNotFoundError

Si ves errores como `ModuleNotFoundError: No module named 'src'`:

1. Asegúrate de estar en la raíz del proyecto
2. Verifica que existan los archivos `__init__.py` en cada carpeta
3. Reinstala el paquete: `pip install -e .`

### Error: No se encuentra data_dir

Si el agente no encuentra los documentos:

1. Verifica que exista la carpeta `data/raw/processed`
2. Copia los documentos desde el repositorio anterior
3. O ajusta la ruta en `src/config.py`

### Error: ChromaDB no inicializa

Si hay problemas con ChromaDB:

```bash
# Eliminar base vectorial corrupta
rm -rf vectordb/

# Reiniciar la app
streamlit run app.py
```

## ✅ Verificación

Después de migrar, verifica que todo funcione:

1. **Ejecutar la app:**
   ```bash
   streamlit run app.py
   ```

2. **Probar en consola:**
   ```python
   from src.agent import ManuelitaAgent
   
   agent = ManuelitaAgent()
   result = agent.process("¿Quién es Manuelita?")
   print(result['answer'])
   ```

3. **Verificar rutas:**
   ```python
   from src.config import config
   print(config.to_dict())
   ```

## 📚 Recursos

- **README.md**: Documentación principal
- **pyproject.toml**: Configuración de dependencias
- **.env.example**: Ejemplo de variables de entorno

## 💡 Ventajas de la Nueva Estructura

1. **Modular**: Código organizado por responsabilidades
2. **Escalable**: Fácil agregar nuevos módulos
3. **Profesional**: Sigue convenciones de Python
4. **Testeable**: Estructura preparada para pruebas unitarias
5. **Limpio**: Separación clara entre app y lógica de negocio

---

¿Preguntas? Revisa el README.md o contacta al equipo de desarrollo.
