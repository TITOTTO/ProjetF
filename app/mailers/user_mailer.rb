class UserMailer < ApplicationMailer
    default from: 'kuaker26@gmail.com'

     def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
         @user = user
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
         @url  = 'https://github.com/TITOTTO'
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
         mail(to: @user.email, subject: 'Bienvenue chez nous !')
     end

     def order(order)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
         @article = order.articles
         @user = order.user
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
         mail(to: @user.email, subject: 'Merci pour votre commande')
     end
end
