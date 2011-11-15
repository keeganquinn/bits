<VirtualHost *:80>
    ServerName micrtoneroregon.com
    ServerAlias www.micrtoneroregon.com \
        micrtonerarizona.com www.micrtonerarizona.com \
        micrtonercalifornia.com www.micrtonercalifornia.com \
        micrtonercarolina.com www.micrtonercarolina.com \
        micrtonerchicago.com www.micrtonerchicago.com \
        micrtonercolorado.com www.micrtonercolorado.com \
        micrtonercolumbus.com www.micrtonercolumbus.com \
        micrtonerdakota.com www.micrtonerdakota.com \
        micrtonerdallas.com www.micrtonerdallas.com \
        micrtonerdenver.com www.micrtonerdenver.com \
        micrtonerflorida.com www.micrtonerflorida.com \
        micrtonerlasvegas.com www.micrtonerlasvegas.com \
        micrtonermiami.com www.micrtonermiami.com \
        micrtonermichigan.com www.micrtonermichigan.com \
        micrtonermontana.com www.micrtonermontana.com \
        micrtonernevada.com www.micrtonernevada.com \
        micrtonernewjersey.com www.micrtonernewjersey.com \
        micrtonernewyork.com www.micrtonernewyork.com \
        micrtonerphoenix.com www.micrtonerphoenix.com \
        micrtonersanfrancisco.com www.micrtonersanfrancisco.com \
        micrtonerseattle.com www.micrtonerseattle.com \
        micrtonertexas.com www.micrtonertexas.com \
        micrtonerutah.com www.micrtonerutah.com \
        micrtonervirginia.com www.micrtonervirginia.com \
        micrtonerwashington.com www.micrtonerwashington.com

    ServerAdmin webmaster@micrtoneroregon.com
    RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
