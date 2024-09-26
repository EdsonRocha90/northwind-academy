with
    fonte_funcionarios as (
        select * 
        from {{ source('erp_northwind', 'employee') }}
    )

    , renomeacao as (
        select 
            cast(ID as int) as pk_funcionario
            , cast(REPORTSTO as int) fk_gerente
            , FIRSTNAME || ' ' || LASTNAME  as nome_funcionario            
            , cast(TITLE  as varchar) as cargo_funcionario
            , cast(BIRTHDATE as date) as dt_nascimento_funcionario
            , cast(HIREDATE as date) as dt_contratacao
            , cast(CITY as varchar) as cidade_funcionario
            , cast(REGION as varchar) as regiao_funcionario
            , cast(COUNTRY as varchar) pais_funcionario
            --, cast(POSTALCODE as varchar) as
            --, cast(ADDRESS as varchar) as
            --, cast(TITLEOFCOURTESY as varchar)
            --, cast(HOMEPHONE as varchar)
            --, cast(EXTENSION as varchar)
            --, cast(PHOTO as varchar)
            --, cast(NOTES as varchar)
            --, cast(PHOTOPATH as varchar)
        from fonte_funcionarios
    )

select * from renomeacao