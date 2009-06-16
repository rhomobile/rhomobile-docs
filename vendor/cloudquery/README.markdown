cloudquery
==========

Client for Xoopit's cloudquery API

Install
-------

Depends on `json`, `rack`, and `taf2-curb`. The install below should take
care of it. If not, `sudo gem install json rack taf2-curb` will do it.

Be sure you've run `gem sources -a http://gems.github.com` once on your system. Then:

    sudo gem install xoopit-cloudquery

Simple contacts application example
-----------------------------------

    > require 'rubygems'
    => true
    > require 'cloudquery'
    => true
    > include Cloudquery
    => Object
    > secret = Client.get_secret(<account_name>, <password>)
    => "your secret appears here"
    > c = Client.new(:account => '<account_name>', :secret => secret)
    => #<Cloudquery::Client:0x10b1b24 @secure=true, @secret="your secret appears here", @account="<account_name>", @document_id_method=nil>
    > c.add_indexes('superheroes')
    => {"result"=>["kMzzzybpqpY"], "size"=>1, "STATUS"=>200}
    > c.add_schema(File.open('simple.contact.xml'))
    => {"result"=>["ubKme0EX3H2ud7VhBU7qngk3........."], "size"=>1, "STATUS"=>201}
    > doc = {
        'simple.contact.name' => 'Steve Rogers',
        'simple.contact.email' => ['steve.rogers@example.com','captain.america@marvel.com'],
        'simple.contact.telephone' => ['555-555-5555','123-456-6789'],
        'simple.contact.address' => ['Lower East Side, NY NY'],
        'simple.contact.birthday' => Date.parse('July 4, 1917'),
        'simple.contact.note' => 'Captain America!',
      }
    => {"simple.contact.birthday"=>#<Date: 4842827/2,0,2299161>, "simple.contact.address"=>["Lower East Side, NY NY"], "simple.contact.telephone"=>["555-555-5555", "123-456-6789"], "simple.contact.note"=>"Captain America!", "simple.contact.email"=>["steve.rogers@example.com", "captain.america@marvel.com"], "simple.contact.name"=>"Steve Rogers"}
    > c.add_documents('superheroes', doc, 'simple.contact')
    => {"result"=>["nDLCNLPo3oHtxANzG4YBn5kMzzzybpqpY"], "size"=>1, "STATUS"=>201}
    > docs = [
      {
        'simple.contact.name' => 'Clark Kent',
        'simple.contact.email' => ['clark.kent@example.com','superman@dc.com'], 
        'simple.contact.telephone' => ['555-123-1234','555-456-6789'],
        'simple.contact.address' => ['344 Clinton St., Apt. #3B, Metropolis', 'The Fortess of Solitude, North Pole'],
        'simple.contact.birthday' => Date.parse('June 18, 1938'),
        'simple.contact.note' => 'Superhuman strength, speed, stamina, durability, senses, intelligence, regeneration, and longevity; super breath, heat vision, x-ray vision and flight. Member of the justice league.'
      },
      {
        'simple.contact.name' => 'Bruce Wayne',
        'simple.contact.email' => ['bruce.wayne@example.com','batman@dc.com'],
        'simple.contact.telephone' => ['555-123-6666','555-456-6666'],
        'simple.contact.address' => ['1007 Mountain Drive, Gotham', 'The Batcave, Gotham'],
        'simple.contact.birthday' => Date.parse('February 19, 1939'),
        'simple.contact.note' => 'Sidekick is Robin. Has problems with the Joker. Member of   e justice league.'
      }
    ]
    > c.add_documents('superheroes', docs, 'simple.contact')
    => {"result"=>["lQgByVSvJk1skHtKpMYX40kMzzzybpqpY", "weJF4uDPJrlvrETTJQNibFkMzzzybpqpY"], "size"=>2, "STATUS"=>201}
    > c.count_documents('superheroes', '*', 'simple.contact')
    => {"result"=>3, "matches"=>3, "STATUS"=>200}
    > c.get_documents('superheroes', '*', {:fields => 'simple.contact.name'}, 'simple.contact')
    => {"result"=>[{"simple.contact.name"=>"Steve Rogers"}, {"simple.contact.name"=>"Clark Kent"}, {"simple.contact.name"=>"Bruce Wayne"}], "matches"=>3, "size"=>3, "STATUS"=>200}
    > c.get_documents('superheroes', 'name:Steve', {:fields => 'simple.contact.name'}, 'simple.contact')
    => {"result"=>[{"simple.contact.name"=>"Steve Rogers"}], "matches"=>1, "size"=>1, "STATUS"=>200}
    > c.get_documents('superheroes', ':@:justice', {:fields => 'simple.contact.name'}, 'simple.contact')
    => {"result"=>[{"simple.contact.name"=>"Clark Kent"}, {"simple.contact.name"=>"Bruce Wayne"}], "matches"=>2, "size"=>2, "STATUS"=>200}
    > c.modify_documents('superheroes', 'name:steve', {'simple.contact.note' => 'His name is STEVE!'}, 'simple.contact')
    => {"result"=>["nDLCNLPo3oHtxANzG4YBn5kMzzzybpqpY"], "matches"=>1, "size"=>1, "STATUS"=>200}
    > c.delete_documents('superheroes', 'name:steve', 'simple.contact') => {"result"=>["nDLCNLPo3oHtxANzG4YBn5kMzzzybpqpY"], "matches"=>2, "size"=>1, "STATUS"=>200}


Copyright
---------

Copyright (c) 2009 nb.io, LLC and Xoopit, Inc. See LICENSE for details.
