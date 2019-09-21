use sportify;

drop table if exists Matches,TeamPlayer,Friends,FriendRequests,Team,Venue,SportUser,Sport,User;

create table User (
    username varchar(100) primary key,
    firstName varchar(100),
    lastName varchar(100),
    email varchar(100),
    phone bigint(10) not null,
    dob date
);

create table Sport (
    sportName varchar(100) primary key,
    numberOfPlayers int
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
    foreign key (user1) references User(username) on delete cascade,
    foreign key (user2) references User(username) on delete cascade,
    primary key (user1,user2)
);

create table FriendRequests (
    user1 varchar(100),
    user2 varchar(100),
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
    teamDetails varchar(500),
    teamStats varchar(100)
);

create table TeamPlayer(
    playerName varchar(100),
    teamName varchar(100),
    foreign key (playerName) references User(username) on delete cascade,
    foreign key (teamName) references Team(teamName) on delete cascade,
    primary key (playerName,teamName)
);

create table Matches (
    matchId int primary key auto_increment,
    team1 varchar(100),
    team2 varchar(100),
    sport varchar(100),
    isDone  boolean,
    venue int,
    score varchar(500),
    winLost boolean,
    matchDate datetime,
    foreign key (team1) references Team(teamName) on delete cascade,
    foreign key (team2) references Team(teamName) on delete cascade,
    foreign key (sport) references Sport(sportName) on delete cascade,
    foreign key (venue) references Venue(venueId) on delete cascade
);


