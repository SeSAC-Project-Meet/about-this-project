use project_meet;

create table area
(
    area_id    int          not null
        primary key,
    name       varchar(100) not null,
    address    varchar(300) not null,
    created_at datetime(6)  not null,
    updated_at datetime(6)  not null
);

create table badge
(
    badge_id    int          not null
        primary key,
    name        varchar(30)  not null,
    description varchar(100) not null,
    created_at  datetime(6)  not null,
    updated_at  datetime(6)  not null
);

create table chatroom
(
    chatroom_id int          not null
        primary key,
    name        int          not null,
    status      varchar(100) not null,
    created_at  datetime(6)  not null,
    updated_at  datetime(6)  not null
);

create table mbti
(
    mbti_id     int          not null
        primary key,
    type        varchar(15)  not null,
    description varchar(100) not null,
    created_at  datetime(6)  not null,
    updated_at  datetime(6)  not null
);

create table spec
(
    spec_id       int          not null
        primary key,
    name          varchar(100) not null,
    type          varchar(30)  not null,
    verify_domain varchar(100) not null,
    created_at    datetime(6)  not null,
    updated_at    datetime(6)  not null
);

create table tag
(
    tag_id     int          not null
        primary key,
    name       varchar(30)  not null,
    type       varchar(100) null,
    created_at datetime(6)  not null,
    updated_at datetime(6)  not null
);

create table user
(
    user_id    int         not null
        primary key,
    created_at datetime(6) not null,
    updated_at datetime(6) not null,
    name       int         not null,
    nickname   varchar(15) not null,
    birthdate  date        not null
);

create table inquiry
(
    inquiry_id  int           not null
        primary key,
    user_id     int           null,
    title       varchar(100)  not null,
    content     varchar(4096) not null,
    photo_url_1 varchar(1024) null,
    constraint inquiry_user_user_id_fk
        foreign key (user_id) references user (user_id)
);

create table message
(
    message_id  int           not null
        primary key,
    user_id     int           not null,
    chatroom_id int           not null,
    type        varchar(30)   not null,
    text        varchar(4096) null,
    image_url   varchar(1024) null,
    constraint message_chatroom_chatroom_id_fk
        foreign key (chatroom_id) references chatroom (chatroom_id),
    constraint message_user_user_id_fk
        foreign key (user_id) references user (user_id)
);

create table message_user
(
    message_user_id int         not null
        primary key,
    message_id      int         not null,
    checked_user_id int         not null,
    checked_at      datetime(6) not null,
    constraint message_user_message_message_id_fk
        foreign key (message_id) references message (message_id),
    constraint message_user_user_user_id_fk
        foreign key (checked_user_id) references user (user_id)
);

create table user_badge
(
    user_badge_id int         not null
        primary key,
    user_id       int         not null,
    badge_id      int         not null,
    created_at    datetime(6) not null,
    updated_at    datetime(6) not null,
    constraint user_badge_badge_badge_id_fk
        foreign key (badge_id) references badge (badge_id),
    constraint user_badge_user_user_id_fk
        foreign key (user_id) references user (user_id)
);

create table user_blocked
(
    user_blocked_id int         not null
        primary key,
    user_id         int         null,
    opponent_id     int         not null,
    type            varchar(30) not null,
    blocked_at      datetime(6) not null,
    unblocked_at    datetime(6) null,
    constraint user_blocked_user_user_id_fk
        foreign key (user_id) references user (user_id),
    constraint user_blocked_user_user_id_fk_2
        foreign key (opponent_id) references user (user_id)
);

create table user_chatroom
(
    user_chatroom_id int         not null
        primary key,
    user_id          int         null,
    chatroom_id      int         not null,
    user_status      varchar(30) not null,
    created_at       datetime(6) not null,
    updated_at       datetime(6) not null,
    constraint user_chatroom_chatroom_chatroom_id_fk
        foreign key (chatroom_id) references chatroom (chatroom_id),
    constraint user_chatroom_user_user_id_fk
        foreign key (user_id) references user (user_id)
);

create table user_like
(
    user_like_id int         not null
        primary key,
    user_id      int         not null,
    opponent_id  int         not null,
    created_at   datetime(6) not null,
    updated_at   datetime(6) not null,
    constraint user_like_user_user_id_fk_2
        foreign key (opponent_id) references user (user_id)
);

create index user_like_user_user_id_fk
    on user_like (user_id);

create table user_match
(
    user_match_id int         not null
        primary key,
    user_id       int         not null,
    opponent_id   int         not null,
    matched_at    datetime(6) not null,
    constraint user_match_user_user_id_fk
        foreign key (user_id) references user (user_id),
    constraint user_match_user_user_id_fk_2
        foreign key (opponent_id) references user (user_id)
);

create table user_point_change
(
    user_point_change_id int          not null
        primary key,
    user_id              int          not null,
    point_change         int          not null,
    description          varchar(100) not null,
    created_at           datetime(6)  not null,
    updated_at           datetime(6)  not null,
    constraint user_point_change_user_user_id_fk
        foreign key (user_id) references user (user_id)
);

create table user_profile
(
    user_profile_id     int          not null
        primary key,
    user_id             int          not null,
    mbti_id             int          null,
    short_introduce     varchar(100) not null,
    area_id_1           int          not null,
    area_id_2           int          null,
    area_id_3           int          null,
    profile_photo_url_1 varchar(100) not null,
    profile_photo_url_2 varchar(100) null,
    profile_photo_url_3 varchar(100) null,
    created_at          datetime(6)  not null,
    updated_at          datetime(6)  not null,
    constraint user_profile_area_area_id_fk
        foreign key (area_id_1) references area (area_id),
    constraint user_profile_area_area_id_fk_2
        foreign key (area_id_2) references area (area_id),
    constraint user_profile_area_area_id_fk_3
        foreign key (area_id_3) references area (area_id),
    constraint user_profile_ibfk_1
        foreign key (user_id) references user (user_id),
    constraint user_profile_mbti_mbti_id_fk
        foreign key (mbti_id) references mbti (mbti_id)
);

create index user_id
    on user_profile (user_id);

create table user_spec
(
    user_spec_id int         not null
        primary key,
    user_id      int         not null,
    spec_id      int         not null,
    created_at   datetime(6) not null,
    updated_at   datetime(6) not null,
    constraint user_spec_spec_spec_id_fk
        foreign key (spec_id) references spec (spec_id),
    constraint user_spec_user_user_id_fk
        foreign key (user_id) references user (user_id)
);

create table user_tag
(
    user_tag_id int         not null
        primary key,
    user_id     int         not null,
    tag_id      int         not null,
    created_at  datetime(6) not null,
    updated_at  datetime(6) not null,
    constraint user_tag_tag_tag_id_fk
        foreign key (tag_id) references tag (tag_id),
    constraint user_tag_user_user_id_fk
        foreign key (user_id) references user (user_id)
);

create table user_token
(
    user_auth_id int         not null
        primary key,
    user_id      int         not null,
    token        int         not null,
    type         varchar(30) not null,
    created_at   datetime(6) not null,
    constraint user_token_user_user_id_fk
        foreign key (user_id) references user (user_id)
);

create table user_usage_time
(
    user_usage_time_id int         not null
        primary key,
    user_id            int         not null,
    type               varchar(30) not null,
    time               datetime    not null,
    constraint user_usage_time_user_user_id_fk
        foreign key (user_id) references user (user_id)
);

create table user_video_call
(
    user_video_call_id int         not null
        primary key,
    user_id            int         not null,
    opponent_id        int         not null,
    time               datetime(6) not null,
    type               varchar(30) not null,
    constraint user_video_call_user_user_id_fk
        foreign key (user_id) references user (user_id),
    constraint user_video_call_user_user_id_fk_2
        foreign key (opponent_id) references user (user_id)
);

