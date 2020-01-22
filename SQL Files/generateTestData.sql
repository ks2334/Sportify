use sportify;

insert into User (username,firstName,lastName,email,password,phone,dob, address) values 
			("user1", "ufirst1", "ulast1", "user1@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address1"),
			("user2", "ufirst2", "ulast2", "user2@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1997','%d-%m-%Y'),"address2"),
			("user3", "ufirst3", "ulast3", "user3@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1996','%d-%m-%Y'),"address3"),
			("user4", "ufirst4", "ulast4", "user4@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1995','%d-%m-%Y'),"address4"),
			("user5", "ufirst5", "ulast5", "user5@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1994','%d-%m-%Y'),"address5"),
			("user6", "ufirst6", "ulast6", "user6@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1993','%d-%m-%Y'),"address6"),
			("user7", "ufirst7", "ulast7", "user7@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1992','%d-%m-%Y'),"address7"),
			("user8", "ufirst8", "ulast8", "user8@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1991','%d-%m-%Y'),"address8"),
			("user9", "ufirst9", "ulast9", "user9@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1990','%d-%m-%Y'),"address9"),
			("user10", "ufirst10", "ulast10", "user10@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-2001','%d-%m-%Y'),"address10"),
			("user11", "ufirst11", "ulast11", "user11@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-2002','%d-%m-%Y'),"address11"),
			("user12", "ufirst12", "ulast12", "user12@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address12"),
			("user13", "ufirst13", "ulast13", "user13@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address13"),
			("user14", "ufirst14", "ulast14", "user14@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address14"),
			("user15", "ufirst15", "ulast15", "user15@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address15"),
			("user16", "ufirst16", "ulast16", "user16@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address16"),
			("user17", "ufirst17", "ulast17", "user17@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address17"),
			("user18", "ufirst18", "ulast18", "user18@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address18"),
			("user19", "ufirst19", "ulast19", "user19@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address19"),
			("user20", "ufirst20", "ulast20", "user20@abc.com", "abcde",9999999999, STR_TO_DATE('24-12-1998','%d-%m-%Y'),"address20");



insert into Sport (sportName) values 
			 ("Tennis"),
			 ("Cricket"),
			 ("Table Tennis"),
			 ("Basketball"),
			 ("Squash"),
			 ("Football");

 
insert into Venue (venueName, venueAddress) values ("venue1","Wanowari,Pune"),
			("venue2","Dhankawadi,Pune"),
			("venue3","Bibwewadi,Pune"),
			("venue4","Kalyani Nagar,Pune"),
			("venue5","Baner Gaon,Pune"),
			("venue6","Balewadi Gaon,Pune"),
			("venue7","NIBM,Pune");

insert into Team values ("Team1",(select sportName from Sport where sportName="Tennis"),"Details Team 1","Stats Team 1"),
			("Team2",(select sportName from Sport where sportName="Table Tennis"),"Details Team 2","Stats Team 2"),
			("Team3",(select sportName from Sport where sportName="Cricket"),"Details Team 3","Stats Team 3"),
			("Team4",(select sportName from Sport where sportName="Tennis"),"Details Team 4","Stats Team 4"),
			("Team5",(select sportName from Sport where sportName="Football"),"Details Team 5","Stats Team 5"),
			("Team6",(select sportName from Sport where sportName="Basketball"),"Details Team 6","Stats Team 6"),
			("Team7",(select sportName from Sport where sportName="Cricket"),"Details Team 7","Stats Team 7"),
			("Team8",(select sportName from Sport where sportName="Football"),"Details Team 8","Stats Team 8"),
			("Team9",(select sportName from Sport where sportName="Tennis"),"Details Team 9","Stats Team 9"),
			("Team10",(select sportName from Sport where sportName="Squash"),"Details Team 10","Stats Team 10");


insert into SportUser (sportName,username) values 
((select sportName from Sport where sportName="Tennis"),(select username from User where username="user1")),
((select sportName from Sport where sportName="Cricket"),(select username from User where username="user1")),
((select sportName from Sport where sportName="Table Tennis"),(select username from User where username="user2")),
((select sportName from Sport where sportName="Tennis"),(select username from User where username="user2")),
((select sportName from Sport where sportName="Squash"),(select username from User where username="user2")),
((select sportName from Sport where sportName="Tennis"),(select username from User where username="user3")),
((select sportName from Sport where sportName="Football"),(select username from User where username="user3")),
((select sportName from Sport where sportName="Basketball"),(select username from User where username="user4")),
((select sportName from Sport where sportName="Basketball"),(select username from User where username="user5")),
((select sportName from Sport where sportName="Football"),(select username from User where username="user4")),
((select sportName from Sport where sportName="Table Tennis"),(select username from User where username="user5")),
((select sportName from Sport where sportName="Squash"),(select username from User where username="user6")),
((select sportName from Sport where sportName="Squash"),(select username from User where username="user7")),
((select sportName from Sport where sportName="Cricket"),(select username from User where username="user6")),
((select sportName from Sport where sportName="Football"),(select username from User where username="user1")),
((select sportName from Sport where sportName="Tennis"),(select username from User where username="user8")),
((select sportName from Sport where sportName="Cricket"),(select username from User where username="user9")),
((select sportName from Sport where sportName="Table Tennis"),(select username from User where username="user10")),
((select sportName from Sport where sportName="Tennis"),(select username from User where username="user11")),
((select sportName from Sport where sportName="Squash"),(select username from User where username="user11")),
((select sportName from Sport where sportName="Tennis"),(select username from User where username="user20")),
((select sportName from Sport where sportName="Football"),(select username from User where username="user11")),
((select sportName from Sport where sportName="Basketball"),(select username from User where username="user2")),
((select sportName from Sport where sportName="Basketball"),(select username from User where username="user3")),
((select sportName from Sport where sportName="Football"),(select username from User where username="user12")),
((select sportName from Sport where sportName="Table Tennis"),(select username from User where username="user13")),
((select sportName from Sport where sportName="Squash"),(select username from User where username="user13")),
((select sportName from Sport where sportName="Squash"),(select username from User where username="user14")),
((select sportName from Sport where sportName="Cricket"),(select username from User where username="user14")),
((select sportName from Sport where sportName="Football"),(select username from User where username="user14")),
((select sportName from Sport where sportName="Tennis"),(select username from User where username="user15")),
((select sportName from Sport where sportName="Cricket"),(select username from User where username="user15")),
((select sportName from Sport where sportName="Table Tennis"),(select username from User where username="user15")),
((select sportName from Sport where sportName="Tennis"),(select username from User where username="user16")),
((select sportName from Sport where sportName="Squash"),(select username from User where username="user16")),
((select sportName from Sport where sportName="Tennis"),(select username from User where username="user18")),
((select sportName from Sport where sportName="Football"),(select username from User where username="user17")),
((select sportName from Sport where sportName="Basketball"),(select username from User where username="user18")),
((select sportName from Sport where sportName="Basketball"),(select username from User where username="user19")),
((select sportName from Sport where sportName="Football"),(select username from User where username="user20")),
((select sportName from Sport where sportName="Table Tennis"),(select username from User where username="user19")),
((select sportName from Sport where sportName="Squash"),(select username from User where username="user20")),
((select sportName from Sport where sportName="Squash"),(select username from User where username="user15")),
((select sportName from Sport where sportName="Cricket"),(select username from User where username="user20"));


insert into Friends (user1,user2,isAccepted) values
((select username from User where username="user1"),(select username from User where username="user2"),false),
((select username from User where username="user2"),(select username from User where username="user3"),false),
((select username from User where username="user3"),(select username from User where username="user1"),false),
((select username from User where username="user4"),(select username from User where username="user1"),false),
((select username from User where username="user5"),(select username from User where username="user1"),false),
((select username from User where username="user6"),(select username from User where username="user4"),false),
((select username from User where username="user5"),(select username from User where username="user2"),false),
((select username from User where username="user5"),(select username from User where username="user3"),false),
((select username from User where username="user6"),(select username from User where username="user5"),false),
((select username from User where username="user6"),(select username from User where username="user10"),false),
((select username from User where username="user8"),(select username from User where username="user7"),false),
((select username from User where username="user4"),(select username from User where username="user8"),false),
((select username from User where username="user10"),(select username from User where username="user8"),false),
((select username from User where username="user9"),(select username from User where username="user10"),false),
((select username from User where username="user9"),(select username from User where username="user1"),false),
((select username from User where username="user9"),(select username from User where username="user3"),false),
((select username from User where username="user9"),(select username from User where username="user5"),false),
((select username from User where username="user9"),(select username from User where username="user7"),false),
((select username from User where username="user9"),(select username from User where username="user12"),false),
((select username from User where username="user12"),(select username from User where username="user13"),false);


insert into TeamPlayer (playerName,teamName,isAccepted,isCaptain) values
((select username from User where username="user1"),(select teamName from Team where teamName="team1"),true,true);
						  

