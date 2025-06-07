import { Router } from 'express'
import { prisma } from '../globals/prismaClient.mjs'
import bcrypt from 'bcryptjs'

const signupRoute = Router()

signupRoute.get('/', (req, res) => {
  res.render('signup')
})

signupRoute.post('/', async (req, res) => {
  const { username, password } = req.body

  const user = await prisma.user.findUnique({
    where: {
      username: username,
    },
  })

  if (user) {
    return res.redirect('/error')
  }

  await prisma.user.create({
    data: {
      username: username,
      password_hash: await bcrypt.hash(password, 10),
    },
  })

  res.redirect('/logout')
})

export default signupRoute
