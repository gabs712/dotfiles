import { passport } from '../globals/passport.mjs'
import { Strategy as LocalStrategy } from 'passport-local'
import { prisma } from '../globals/prismaClient.mjs'
import bcrypt from 'bcryptjs'

passport.use(
  new LocalStrategy(async (username, password, done) => {
    const user = await prisma.user.findUnique({
      where: {
        username: username,
      },
    })

    if (!user) {
      return done(null, false)
    }

    const validPassword = await bcrypt.compare(password, user.password_hash)
    if (!validPassword) {
      return done(null, false)
    }

    done(null, user)
  }),
)

passport.serializeUser((user, done) => {
  done(null, user.id)
})
passport.deserializeUser(async (userId, done) => {
  const user = await prisma.user.findUnique({
    where: {
      id: userId,
    },
  })

  if (!user) {
    return done(null, false)
  }

  done(null, user)
})

export const passportMiddleware = passport.session()
