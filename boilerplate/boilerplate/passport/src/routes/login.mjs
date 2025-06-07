import { Router } from 'express'
import { passport } from '../globals/passport.mjs'

const loginRoute = Router()

loginRoute.get('/', (req, res) => {
  res.render('login')
})

loginRoute.post(
  '/',
  passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/error',
  }),
)

loginRoute.use((err, req, res, next) => {
  res.status(500).send('Internal Server Error')
})

export default loginRoute
