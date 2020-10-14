create sequence hibernate_sequence start 1 increment 1;
create table message (
        id int8 not null,
        filename varchar(255),
        tag varchar(255),
        text varchar(2048) not null,
        user_id int8,
        primary key (id)
);


create table rating_list (
        id int8 not null,
        message varchar(2000),
        rating float8,
        user_id int8,
        teacher_id int8,
        primary key (id)
);


create table teacher (
        id int8 not null,
        imglink varchar(255),
        rating float8,
        teachername varchar(255),
        primary key (id)
);

create table user_role (
        user_id int8 not null,
        roles varchar(255)
);


create table usr (
        id int8 not null,
        activation_code varchar(255),
        active boolean not null,
        email varchar(255),
        password varchar(255) not null,
        username varchar(255) not null,
        primary key (id)
);


alter table if exists message
    add constraint message_user_fk
    foreign key (user_id) references usr;

alter table if exists rating_list
    add constraint rating_list_user_fk
    foreign key (user_id) references usr;

alter table if exists rating_list
    add constraint rating_list_teacher_fk
    foreign key (teacher_id) references teacher;

alter table if exists user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr;









