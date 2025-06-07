export default (req, res, next) => {
  if (!req.isAuthenticated()) {
    return res.redirect('/login')
  }

  next()
}
