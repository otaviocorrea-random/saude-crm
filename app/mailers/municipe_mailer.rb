class MunicipeMailer < ApplicationMailer
  def welcome(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: 'Novo cadasto')
  end

  def update_status(municipe)
    @municipe = municipe
    mail(to: @municipe.email, subject: 'Status atualizado')
  end
end
