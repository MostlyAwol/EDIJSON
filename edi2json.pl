use Data::EDI::X12;
use JSON;
use Data::Dumper;

#open EDI Document
open($EDI, "sampleedi.txt") || die "Can't open file $!\n";
#Read the EDI document into one string
read $EDI, my $record, -s $EDI;
 
#Convert the EDI into a Perl scaler
my $x12 = Data::EDI::X12->new({ spec_file => 'spec.yaml', new_lines => 1, truncate_null => 1 });
my $record = $x12->read_record($string);

#Convert the Perl Scaler into JSON
$json_text = encode_json($record);

#Save the JSON data into a file
open(JSON, ">EDI2JSON.json") || die "Can't open file $!\n";
print JSON "$json_text";
close(JSON);


