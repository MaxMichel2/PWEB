express = require('express')
cors = require('cors')
app = express()
corsOptions =
  origin: 'http://tc-net3.insa-lyon.fr:8000'
  credential: true

app.use(cors(corsOptions))
app.use(express.static('static'))
app.listen 8001

