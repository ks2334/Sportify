create database sportify;
use sportify;

drop table if exists Achievements,NewsFeed,Matches,TeamPlayer,TeamSport,Friends,FriendRequests,Team,Venue,SportUser,Sport,User;

create table User (
    username varchar(100) primary key,
    firstName varchar(100),
    lastName varchar(100),
    email varchar(100),
    password varchar(100),
    phone bigint(10) not null,
    dob date,
    description varchar(100) default "Looking for a Match",
    address varchar(100),
    profilePicture boolean default false,
    level int default 0,
    isBlocked boolean default false
);

create table Sport (
    sportName varchar(100) primary key,
    numberOfPlayers int default 0
);

create table SportUser (
    sportName varchar(100),
    username varchar(100),
    foreign key (sportName) references Sport(sportName) on delete cascade,
    foreign key (username) references User(username) on delete cascade,
    primary key (sportName,username)
);

create table Friends (
    user1 varchar(100),
    user2 varchar(100),
    isAccepted boolean default false,
    foreign key (user1) references User(username) on delete cascade,
    foreign key (user2) references User(username) on delete cascade,
    primary key (user1,user2)
);


create table Venue(
    venueId int primary key auto_increment,
    venueName varchar(200),
    venueAddress varchar(500)
);


create table Team (
    teamName varchar(100) primary key,
    sportName varchar(100),
    teamDetails varchar(500) default "",
    teamStats varchar(100) default "",
	foreign key (sportName) references Sport(sportName) on delete cascade
);


create table TeamPlayer(
    playerName varchar(100),
    teamName varchar(100),
    isCaptain boolean default false,
    isAccepted boolean default false,
    foreign key (playerName) references User(username) on delete cascade,
    foreign key (teamName) references Team(teamName) on delete cascade,
    primary key (playerName,teamName)
);

create table Matches (
    matchId int primary key auto_increment,
    team1 varchar(100),
    team2 varchar(100),
    sport varchar(100),
    isDone  boolean default false,
    venue int,
    score varchar(500) default "",
    isAccepted boolean default false,
    winLost boolean,
    matchDate datetime,
    foreign key (team1) references Team(teamName) on delete cascade,
    foreign key (team2) references Team(teamName) on delete cascade,
    foreign key (sport) references Sport(sportName) on delete cascade,
    foreign key (venue) references Venue(venueId) on delete cascade
);

create table UserMatches (
    matchId int primary key auto_increment,
    user1 varchar(100),
    user2 varchar(100),
    sport varchar(100),
    isDone  boolean default false,
    venue int,
    score varchar(500) default "",
    isAccepted boolean default false,
    winLost boolean,
    matchDate datetime,
    foreign key (user1) references User(username) on delete cascade,
    foreign key (user2) references User(username) on delete cascade,
    foreign key (sport) references Sport(sportName) on delete cascade,
    foreign key (venue) references Venue(venueId) on delete cascade
);

create table Achievements (
    achievementId int primary key auto_increment,
	username varchar(100),


	sportName varchar(100),
	description varchar(500),
	image varchar(100),
	foreign key (username) references User(username) on delete cascade,
	foreign key (sportName) references Sport(sportName) on delete cascade
);


create table NewsFeed (
	username varchar(100),
	description varchar(1000),
	time datetime,
	claps int default 0,
	foreign key (username) references User(username) on delete cascade
);



delimiter //
create trigger defaultUserTeam 
after insert on User 
for each row 
begin
 insert into Team (teamName,teamDetails) values (new.username,"Self_Team");
end; //
delimiter ;








