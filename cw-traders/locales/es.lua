local Translations = {
    error = {
        ["canceled"]                    = "Cancelado",
        ["someone_recently_did_this"]   = "Alguien recientemente hizo esto, inténtalo de nuevo más tarde.r..",
        ["cannot_do_this_right_now"]    = "No puedo hacer esto ahora mismo...",
        ["you_failed"]                  = "Fallaste!",
        ["you_cannot_do_this"]          = "No puedes hacer esto..",
        ["you_dont_have_enough_money"]  = "No tienes suficiente dinero",
    },
    success = {
        ["case_has_been_unlocked"]              = "Meleta de seguridad ha sido desbloqueado",
        ["you_removed_first_security_case"]     = "Eliminó la primera capa de seguridad de la maleta",
        ["you_got_paid"]                        = "Te pagaron",
        ["send_email_right_now"]                = "Te enviaré un correo electrónico ahora mismo!",
    },
    info = {
        ["talking_to_boss"]             = "Hablando con el jefe..",
        ["unlocking_case"]              = "Desbloqueando maletin..",
        ["checking_quality"]            = "Comprobando calidad",
    },
    mailstart = {
        ["sender"]                      = "Desconocido",
        ["subject"]                     = "Ubicación del vehículo",
        ["message"]                     = "Actualicé su gps con la ubicación de un vehículo del que recibí una pista que contiene un maletín. Recupera lo que hay dentro y tráemelo. Te he dado una clave especial que se usaría para quitar la primera capa de seguridad del meletin..",
    },
    mail = {
        ["sender"]                      = "Desconocido",
        ["subject"]                     = "Recogida de Mercancías",
        ["message"]                     = "Parece que tienes los productos, el maletin debería desbloquearse automáticamente en 5 minutos después de desbloquear la primera capa de seguridad. Una vez completado, tráigame los artículos y reciba el pago.",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
