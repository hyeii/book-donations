# Book DB

create table if not exists book
(
    id            bigint auto_increment
    primary key,
    title         text null,
    vol           text null,
    series_title  text null,
    series_no     text null,
    author        text null,
    ea_isbn       text null,
    ea_add_code   text null,
    set_isbn      text null,
    set_add_code  text null,
    publisher     text null,
    page          text null,
    book_size     text null,
    subject       text null,
    title_url     text null,
    publisher_url text null,
    input_date    text null,
    update_date   text null
);

create index idx_isbn
    on book (ea_isbn(25));

create table if not exists likes
(
    id         bigint auto_increment
    primary key,
    local_code varchar(20) not null,
    member_id  bigint      null,
    book_id    bigint      null,
    constraint FK1i5rjsjrgrt9gg2mgv9uja3ge
    foreign key (book_id) references book (id)
    );

create table if not exists review
(
    id         bigint auto_increment
    primary key,
    created_at datetime     null,
    review     varchar(255) null,
    writer     varchar(255) null,
    book_id    bigint       null,
    constraint FK70yrt09r4r54tcgkrwbeqenbs
    foreign key (book_id) references book (id)
    );

# Donation
create table donation
(
    id         bigint auto_increment
        primary key,
    address    varchar(255) null,
    content    varchar(255) null,
    delivery   bit          not null,
    created_at datetime     not null,
    member_id  bigint       not null,
    status     varchar(10)  not null,
    isbn       varchar(20)  not null
);

create table donation_image
(
    id          bigint auto_increment
        primary key,
    donation_id bigint       not null,
    url         varchar(255) not null,
    member_id   bigint       null
);

create table history
(
    id          bigint auto_increment
        primary key,
    content     varchar(255) null,
    created_at  datetime     null,
    donated_at  datetime     null,
    donation_id bigint       null,
    member_id   bigint       null,
    status      varchar(255) null
);

create table trade
(
    id          bigint auto_increment
        primary key,
    donation_id bigint       null,
    member_id   bigint       null,
    status      varchar(255) null
);

# Member DB
create table member
(
    id        bigint auto_increment
        primary key,
    address   int           null,
    email     varchar(25)   null,
    image     varchar(255)  null,
    nickname  varchar(20)   null,
    oauth_id  varchar(255)  null,
    point     int default 0 null,
    roles     varchar(255)  null,
    fcm_token varchar(300)  null,
    constraint UK_h75gn6cmrki5jnmilofg9ejkt
        unique (oauth_id),
    constraint UK_hh9kg6jti4n1eoiertn2k6qsc
        unique (nickname)
);

create index idx_nickname
    on member (nickname);

create index idx_oauth_id
    on member (oauth_id);

# Notification DB
create table push_notification
(
    id         bigint auto_increment
        primary key,
    created_at timestamp default CURRENT_TIMESTAMP null,
    member_id  bigint                              null,
    message    varchar(255)                        null
);