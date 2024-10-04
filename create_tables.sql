--clean birthday before loading, make to date
--clean height into int
--Check draft_round

CREATE TABLE player(
    id int PRIMARY KEY,
    full_name varchar(255),
    first_name varchar(255),
    last_name varchar(255),
    is_active int
);

CREATE TABLE common_player_info (
    person_id int FOREIGN KEY,
    first_name varchar(255),
    last_name varchar(255),
    display_first_last varchar(255),
    display_last_comma_first varchar(255),
    display_fi_last varchar(255),
    player_slug varchar(255),
    birthdate DATE,
    country varchar(255),
    last_affiliation varchar(255),
    height int,
    weight int,
    season_exp int,
    jersey int,
    position varchar(255),
    rosterstatus varchar(255),
    games_played_current_season_flag char(1),
    team_id int FOREIGN KEY,
    team_name varchar(255),
    team_abbreviation char(3),
    team_code varchar(255),
    team_city varchar(255),
    playercode varchar(255),
    from_year int,
    to_year int,
    dleague_flag char(1),
    nba_flag char(1),
    games_played_flag char(1),
    draft_year int,
    draft_round varchar(255),
    draft_number int,
    greatest_75_flag char(1)
    FOREIGN KEY player_id REFERENCES player(id),
    FOREIGN KEY team_id REFERENCES team(id)
);

CREATE TABLE draft_combine_stats (
    season int,
    player_id int FOREIGN KEY,
    first_name varchar(255),
    last_name varchar(255),
    player_name varchar(225),
    position varchar(255),
    height_inch DECIMAL,
    weight int,
    wingspan DECIMAL,
    standing_reach DECIMAL,
    body_fat_pct DECIMAL,
    hand_length DECIMAL,
    hand_width DECIMAL,
    standing_vertical_leap DECIMAL,
    max_vertical_leap DECIMAL,
    lane_agility_time DECIMAL,
    modified_lane_agility_time DECIMAL,
    three_quarter_sprint DECIMAL,
    bench_press int,
    position_1 varchar(255),
    position_2 varchar(255),
    FOREIGN KEY player_id REFERENCES player(id)
);

CREATE TABLE draft_history (
    person_id int FOREIGN KEY,
    player_name varchar(225),
    season int,
    round_number int,
    round_pick int,
    overall_pick int,
    draft_type varchar(255),
    team_id int FOREIGN KEY,
    team_city varchar(255),
    team_name varchar(255),
    team_abbreviation char(3),
    organization varchar(255),
    organization_type varchar(255),
    player_profile_flag int,
    FOREIGN KEY player_id REFERENCES player(id),
    FOREIGN KEY team_id REFERENCES team(id)
);

--need to change game time to TIME datatype
CREATE TABLE game_info (
    game_id int PRIMARY KEY,
    game_date DATE,
    attendance int,
    game_time TIME,
);

CREATE TABLE game (
    season_id int PRIMARY KEY,
    team_id_home int FOREIGN KEY,
    team_abbreviation_home char(3),
    team_name_home varchar(255),
    game_id int FOREIGN KEY,
    game_date DATE,
    matchup_home varchar(255),
    wl_home char(1),
    min int,
    fgm_home int,
    fga_home int,
    fg_pct_home DECIMAL,
    fg3m_home int,
    fg3a_home int,
    fg3_pct_home DECIMAL,
    ftm_home int,
    fta_home int,
    ft_pct_home DECIMAL,
    oreb_home int,
    dreb_home int,
    reb_home int,
    ast_home int,
    stl_home int,
    blk_home int,
    tov_home int,
    pf_home int,
    pts_home int,
    plus_minus_home int,
    video_available_home int,
    team_id_away int FOREIGN KEY,
    team_abbreviation_away char(3),
    team_name_away varchar(255),
    matchup_away varchar(255),
    wl_away char(1),
    fgm_away int,
    fga_away int,
    fg_pct_away DECIMAL,
    fg3m_away int,
    fg3a_away int,
    fg3_pct_away DECIMAL,
    ftm_away int,
    fta_away int,
    ft_pct_away DECIMAL,
    oreb_away int,
    dreb_away int,
    reb_away int, 
    ast_away int,
    stl_away int,
    blk_away int,
    tov_away int,
    pf_away int,
    pts_away int,
    plus_minus_away int,
    video_available_away int,
    season_type varchar(255),
    FOREIGN KEY team_id_home REFERENCES team(id),
    FOREIGN KEY team_id_away REFERENCES team(id),
    FOREIGN KEY game_id REFERENCES game_info(game_id)
);


CREATE TABLE game_summary (
    game_date_est DATE,
    game_sequence int,
    game_id int FOREIGN KEY,
    game_status_id int,
    gamecode varchar(255),
    home_team_id int FOREIGN KEY,
    visitor_team_id int FOREIGN KEY,
    season int,
    live_period int,
    natl_tv_broadcaster_abbreviation varchar(255),
    live_period_time_bcast varchar(255),
    FOREIGN KEY (home_team_id) REFERENCES team(id),
    FOREIGN KEY visitor_team_id REFERENCES team(id),
    FOREIGN KEY game_id REFERENCES game_info(game_id)
);

CREATE TABLE inactive_players (
    game_id int FOREIGN KEY,
    player_id int FOREIGN KEY,
    first_name varchar(255),
    last_name varchar(255),
    jersey_num int,
    team_id int FOREIGN KEY,
    team_city varchar(255),
    team_name varchar(255),
    team_abbreviation char(3),
    FOREIGN KEY game_id REFERENCES game_info(game_id),
    FOREIGN KEY player_id REFERENCES player(id),
    FOREIGN KEY team_id REFERENCES team(id),
);

--pts_qtr1_home needs to be cleaned to int
CREATE TABLE line_score (
    game_date_est DATE,
    game_sequence int,
    game_id int FOREIGN KEY,
    team_id_home int FOREIGN KEY,
    team_abbreviation_home char(3),
    team_city_name_home varchar(255),
    team_nickname_home varchar(255),
    team_wins_losses_home varchar(255),
    pts_qtr1_home int,
    pts_qtr2_home int,
    pts_qtr3_home int,
    pts_qtr4_home int,
    pts_ot1_home int,
    pts_ot2_home int,
    pts_ot3_home int,
    pts_ot4_home int,
    pts_home int,
    team_id_away int FOREIGN KEY,
    team_abbreviation_away char(3),
    team_city_name_away varchar(255),
    team_nickname_away varchar(255),
    team_wins_losses_away varchar(255),
    pts_qtr1_away int,
    pts_qtr2_away int,
    pts_qtr3_away int,
    pts_qtr4_away int,
    pts_ot1_away int,
    pts_ot2_away int,
    pts_ot3_away int,
    pts_ot4_away int,
    pts_away int,
    FOREIGN KEY game_id REFERENCES game_info(game_id),
    FOREIGN KEY team_id_home FOREIGN KEY team(id),
    FOREIGN KEY team_id_away FOREIGN KEY team(id)
    );

CREATE TABLE officials (
    game_id int FOREIGN KEY,
    official_id int PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255),
    jersey_num int,
    FOREIGN KEY game_id REFERENCES game_info(game_id)
);

CREATE TABLE other_stats (
    game_id int FOREIGN KEY,
    league_id int PRIMARY KEY,
    team_id_home int FOREIGN KEY,
    team_abbreviation_home char(3),
    team_city_home varchar(255),
    pts_paint_home int,
    pts_2nd_chance_home int,
    pts_fb_home int,
    largest_lead_home int,
    lead_changes int,
    times_tied int,
    team_turnovers_home int,
    total_turnovers_home int,
    team_rebounds_home int,
    pts_off_to_home int,
    team_id_away int FOREIGN KEY,
    team_abbreviation_away char(3),
    team_city_away varchar(255),
    pts_paint_away int,
    pts_2nd_chance_away int,
    pts_fb_away int,
    largest_lead_away int,
    lead_changes int,
    times_tied int,
    team_turnovers_away int,
    total_turnovers_away int,
    team_rebounds_away int,
    pts_off_to_away int,
    FOREIGN KEY game_id REFERENCES game_info(game_id),
    FOREIGN KEY team_id_home REFERENCES team(id),
    FOREIGN KEY team_id_away REFERENCES team(id)
);

CREATE TABLE team_details (
    team_id int FOREIGN KEY,
    abbreviation char(3),
    nickname varchar(255),
    yearfounded int,
    city varchar(255),
    arena varchar(255),
    arenacapacity int,
    owner varchar(255),
    generalmanager varchar(255),
    headcoach varchar(255),
    dleagueaffiliation varchar(255),
    facebook varchar(255),
    instagram varchar(255),
    twitter varchar(255)
    FOREIGN KEY team_id REFERENCES team(id)
);

CREATE TABLE team_history (
    team_id int FOREIGN KEY,
    city varchar(255),
    nickname varchar(255),
    year_founded int,
    year_active_till int
    FOREIGN KEY team_id REFERENCES team(id)
);









