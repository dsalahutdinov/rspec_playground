defult:
	docker volume create bundle
	docker-compose run --rm app bundle install

rspec:
	docker-compose run --rm app bundle exec rspec

rspec_before_all:
	docker-compose run --rm app bundle exec rspec -o /dev/null spec/before_all_spec.rb

rspec_before:
	docker-compose run --rm app bundle exec rspec -o /dev/null spec/before_spec.rb

rspec_let:
	docker-compose run --rm app bundle exec rspec -o /dev/null spec/let_spec.rb 

rspec_let_bang:
	docker-compose run --rm app bundle exec rspec -o /dev/null spec/let_bang_spec.rb 
