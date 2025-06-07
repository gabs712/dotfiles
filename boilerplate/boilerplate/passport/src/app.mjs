import { configDotenv } from 'dotenv'
import express from 'express'
import { join } from 'path'
import { SessionMiddleware } from './credentials/session.mjs'
import { passportMiddleware } from './credentials/passport.mjs'
import rootRoute from './routes/root.mjs'
import loginRoute from './routes/login.mjs'
import signupRoute from './routes/signup.mjs'

configDotenv()

const app = express()

app.set('view engine', 'ejs')
app.set('views', join(import.meta.dirname, 'views'))

app.use(express.static('src/public'))

app.use(express.urlencoded({ extended: true }))

app.use(SessionMiddleware)
app.use(passportMiddleware)

app.use('/', rootRoute)
app.use('/login', loginRoute)
app.use('/signup', signupRoute)

const port = process.env.PORT
app.listen(port, () => {
  console.log(`Server is running on port ${port}`)
})
