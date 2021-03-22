# README

This README would normally document whatever steps are necessary to get the
application up and running.

# Working Cycle

- You can run with this rspec code from the console :

		rspec spec/requests/campaigns_spec.rb


# Things you may want to cover:

* Ruby version
  ruby -v
  ruby 2.6.4p104 (2019-08-28 revision 67798) [x86_64-darwin18
  
* RVM Gemset 
  tapresearch


* Configuration
	 - When you enter the  application main path, this .ruby_gemset and .ruby-version will start to generate whatever you need to run this application.


* Database creation
	 - postgresql

* How to run development

	You can download postman json structure
	
	[Assessment.postman_collection.json.zip](https://github.com/muratatak77/batch_process/files/6179233/Assessment.postman_collection.json.zip)

	you can complete :
	
	1 - POST CREATE - Campaigns - local - http://127.0.0.1:3000/campaigns
	
	2 - POST CREATE - Campaigns Quotas - local - http://127.0.0.1:3000/campaign_quotas
	
	3 - GET - ordered_campaigns - http://127.0.0.1:3000/ordered_campaigns
	

* How to run the test suite
	
	- I used rspec gem. 

	- And we can go to the application path and we can run by from the console: 		
		
		 rspec spec/requests/campaigns_spec.rb
		
		 	
	- Result 
	
			[
			  {
			    "id": 278566,
			    "length_of_interview": 15,
			    "cpi": "12.0",
			    "name": "Elmo",
			    "campaign_quotas": [
			      {
				"id": 1118458,
				"num_respondents": 1234,
				"campaign_qualifications": [
				  {
				    "question_id": 42,
				    "pre_codes": "13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34"
				  },
				  {
				    "question_id": 632,
				    "pre_codes": "2"
				  }
				]
			      }
			    ]
			  },
			  {
			    "id": 278570,
			    "length_of_interview": 8,
			    "cpi": "7.0",
			    "name": "Ernie",
			    "campaign_quotas": [
			      {
				"id": 1118462,
				"num_respondents": 543,
				"campaign_qualifications": [
				  {
				    "question_id": 43,
				    "pre_codes": "1"
				  }
				]
			      }
			    ]
			  },
			  {
			    "id": 278565,
			    "length_of_interview": 4,
			    "cpi": "1.0",
			    "name": "Cookie Monster",
			    "campaign_quotas": [
			      {
				"id": 1118457,
				"num_respondents": 143,
				"campaign_qualifications": [
				  {
				    "question_id": 43,
				    "pre_codes": "2"
				  }
				]
			      }
			    ]
			  },
			  {
			    "id": 278568,
			    "length_of_interview": 13,
			    "cpi": "4.0",
			    "name": "Snuffy",
			    "campaign_quotas": [
			      {
				"id": 1118460,
				"num_respondents": 33,
				"campaign_qualifications": [
				  {
				    "question_id": 43,
				    "pre_codes": "2"
				  }
				]
			      }
			    ]
			  },
			  {
			    "id": 278567,
			    "length_of_interview": 3,
			    "cpi": "3.0",
			    "name": "Grover",
			    "campaign_quotas": [
			      {
				"id": 1118459,
				"num_respondents": 432,
				"campaign_qualifications": [
				  {
				    "question_id": 42,
				    "pre_codes": "34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55"
				  }
				]
			      }
			    ]
			  },
			  {
			    "id": 278562,
			    "length_of_interview": 10,
			    "cpi": "2.0",
			    "name": "Cereal",
			    "campaign_quotas": [
			      {
				"id": 1118454,
				"num_respondents": 100,
				"campaign_qualifications": [
				  {
				    "question_id": 42,
				    "pre_codes": "13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99"
				  }
				]
			      }
			    ]
			  },
			  {
			    "id": 278563,
			    "length_of_interview": 2,
			    "cpi": "1.25",
			    "name": "Pizza",
			    "campaign_quotas": [
			      {
				"id": 1118455,
				"num_respondents": 123,
				"campaign_qualifications": [
				  {
				    "question_id": 43,
				    "pre_codes": "1"
				  }
				]
			      }
			    ]
			  },
			  {
			    "id": 278564,
			    "length_of_interview": 25,
			    "cpi": "4.25",
			    "name": "California",
			    "campaign_quotas": [

			    ]
			  },
			  {
			    "id": 278569,
			    "length_of_interview": 4,
			    "cpi": "5.0",
			    "name": "Oscar",
			    "campaign_quotas": [

			    ]
			  }
			]
