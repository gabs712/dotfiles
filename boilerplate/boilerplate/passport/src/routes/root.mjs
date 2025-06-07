import { Router } from 'express'
import checkAuth from '../middlewares/checkAuth.mjs'

const rootRoute = Router()

rootRoute.get('/', checkAuth, (req, res) => {
  res.render('home', { user: req.user })
})

rootRoute.get('/error', (req, res) => {
  res.send('Something went wrong')
})

rootRoute.get('/logout', checkAuth, function (req, res) {
  req.logout((err) => {
    if (err) {
      return next(err)
    }

    res.redirect('/login')
  })
})

rootRoute.use((err, req, res, next) => {
  res.status(500).send('Internal Server Error')
})

export default rootRoute
