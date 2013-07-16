use strict;
use vars qw($VERSION %IRSSI);
use Irssi;

$VERSION = "0.1";
%IRSSI = (
   authors      => "Nicholas Penree",
   contact      => "nick\@penree.com",
   name         => "weather",
   description  => "Output weather information",
   url          => "http://penree.com",
   license      => "MIT"
);

sub urlencode {
    my $s = shift;
    $s =~ s/ /+/g;
    $s =~ s/([^A-Za-z0-9\+-])/sprintf("%%%02X", ord($1))/seg;
    return $s;
}

sub get_weather {
   my ($data, $server, $channel) = @_;
   my $input = $data; $input =~ s/weather//ig;
   my $location = Irssi::settings_get_str("weather_location");

   if ($input) {
      $location = $input;
   }
   
   $location = urlencode($location);
   
   my $xml = `curl --stderr /dev/null "http://api.wunderground.com/auto/wui/geo/WXCurrentObXML/index.xml?query=$location"`;
   
   if (!$xml) {
      Irssi::active_win()->print("There was an error setting the variables. Please try again.");
      return;
   }
   
   my ($fullLocation) = $xml =~ /<display_location>.*<full>(.*)<\/full>.*<\/display_location>/igs;
   
   if ($fullLocation eq ", " or $fullLocation eq "") {
      Irssi::active_win()->print("Please input a proper location or zip code (US or Canada).");
      return;
   }
   
   my ($currentTemp) = $xml =~ /<temperature_string>(.*)<\/temperature_string>/igs;
   $currentTemp =~ s/ C/°C/g;
   $currentTemp =~ s/ F/°F/g;
   
   if (index($currentTemp, "°F (°C)") != -1) {
      Irssi::active_win()->print("Please input a proper location or zip code (US or Canada).");
      Irssi::active_win()->print("Note: Just entering a country as a location will not work.");
      return;
   }
   
   my ($currentConditions) = $xml =~ /<weather>(.*)<\/weather>/igs;
   my ($currentHumidity) = $xml =~ /<relative_humidity>(.*)<\/relative_humidity>/igs;
   my ($currentWindMPH) = $xml =~ /<wind_mph>(.*)<\/wind_mph>/igs;
   my ($currentWindDIR) = $xml =~ /<wind_dir>(.*)<\/wind_dir>/igs;
   
   my $item = ref Irssi::active_win() ? Irssi::active_win()->{active} : '';
   my $out = "Weather for $fullLocation · $currentTemp · " .
             "Humidity: $currentHumidity · $currentConditions · " .
             "Wind: $currentWindDIR at $currentWindMPH mph";
             
   if(ref $item && $item->{type} eq 'CHANNEL') {
      Irssi::active_win()->command("SAY $out");
   } else {
      Irssi::active_win()->print($out);
   }
}

Irssi::settings_add_str("weather", "weather_location", "12020");
Irssi::command_bind("weather", "get_weather");