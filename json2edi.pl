use Data::EDI::X12;
use JSON;
use Data::Dumper;

#open JSON Document
open($JSON, "EDI2JSON.json") || die "Can't open file $!\n";
#Read the JSON document into one string
read $JSON, my $json_text, -s $JSON;

#Convert the JSON to PERL
$record = decode_json($json_text);
 
#Convert the JSON into a EDI Format
my $x12 = Data::EDI::X12->new({ spec_file => 'spec.yaml', new_lines => 1, truncate_null => 1 });
$out = $x12->write_record($record);

#Save the JSON data into a file
open(EDI, ">JSON2EDI.txt") || die "Can't open file $!\n";
print EDI "$out";
close(EDI);

