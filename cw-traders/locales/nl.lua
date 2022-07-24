local Translations = {
    error = {
        ["canceled"]                    = "Geannuleerd",
        ["someone_recently_did_this"]   = "Iemand was je voor, probeer het later nog eens..",
        ["cannot_do_this_right_now"]    = "Je kunt dit nu niet doen...",
        ["you_failed"]                  = "Hack gefaald!",
        ["you_cannot_do_this"]          = "Je kunt dit niet doen..",
        ["you_dont_have_enough_money"]  = "Je hebt niet genoeg geld",
    },
    success = {
        ["case_has_been_unlocked"]              = "Veiligheidskoffer ontgrendelt",
        ["you_removed_first_security_case"]     = "Je hebt het eerste veiligheids slot van de koffer gehaald",
        ["you_got_paid"]                        = "Goed gedaan, hier is je betaling ",
    },
    info = {
        ["talking_to_boss"]             = "Praten met baas..",
        ["unlocking_case"]              = "Koffer Ontgrendelen..",
        ["checking_quality"]            = "Kwaliteit Controleren",
    },
    mailstart = {
        ["sender"]                      = "Onbekend",
        ["subject"]                     = "Voertuig Locatie",
        ["message"]                     = "ik Heb je gps geüpdate met de locatie naar een voertuig. Ik heb een tip gekregen over dat er een koffer in zit. Haal de koffer op en wacht tot het slot eraf is, en breng het spul terug naar mij. Ik heb je een speciale sleutel gegeven die je moet gebruiken om de eerste beveiligingslaag van de koffer te verwijderen..",
    },
    mail = {
        ["sender"]                      = "Onbekend",
        ["subject"]                     = "Goederen Locatie",
        ["message"]                     = "Het lijkt erop dat je de goederen hebt gevonden, de koffer zou automatisch moeten ontgrendelen 5 minuten nadat je de eerste beveiligingslaag van de koffer hebt gehaald. Zodra dit gebeurt is, breng het spul terug naar mij en je word betaald.",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})