CLASS lhc_rating DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS DetermineUserName FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineUserName.
    METHODS DetermineRatingDate FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineRatingDate.

ENDCLASS.

CLASS lhc_rating IMPLEMENTATION.


  METHOD DetermineRatingDate.

    DATA rating TYPE TABLE FOR UPDATE zr_13_RatingTP.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #( %tky = key-%tky
                      ratingdate = sy-datum ) TO rating.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_13_MovieTP IN LOCAL MODE
      ENTITY Rating
      UPDATE
      FIELDS ( ratingdate )
      WITH rating.

  ENDMETHOD.




  METHOD DetermineUserName.

    DATA rating TYPE TABLE FOR UPDATE zr_13_RatingTP.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #( %tky = key-%tky
                      username = sy-uname ) TO rating.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_13_MovieTP IN LOCAL MODE
      ENTITY Rating
      UPDATE
      FIELDS ( username )
      WITH rating.

  ENDMETHOD.



ENDCLASS.

CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS ValidateGenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~ValidateGenre.
    METHODS RateMovie FOR MODIFY
      IMPORTING keys FOR ACTION Movie~RateMovie. "RESULT result.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateGenre.


    DATA Genres TYPE TABLE FOR READ RESULT zr_13_MovieTP.
    DATA failed_genres TYPE RESPONSE for failed ZR_13_MovieTP.

    " Read Travels
    READ ENTITIES OF zr_13_MovieTP IN LOCAL MODE
      ENTITY Movie
      FIELDS ( Genre )
      WITH CORRESPONDING #( keys )
      result Genres.

    " Process Travels
    LOOP AT Genres into data(movie).

      " Validate Customer and Create Error Message
      SELECT SINGLE FROM zabap_movie_a
        FIELDS @abap_true
        WHERE genre = @movie-genre
        INTO @data(exists).

      IF exists IS INITIAL.
        APPEND VALUE #( %tky = movie-%tky ) TO failed-movie.
        DATA(message) = NEW zcm_abap_movie( textid      = zcm_abap_movie=>no_genre_found
                                            genre = movie-Genre
                                            severity    = if_abap_behv_message=>severity-error ).

        APPEND VALUE #( %tky                = movie-%tky
                        %msg                = message
                        %element-Genre = if_abap_behv=>mk-on  ) TO reported-movie.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD RateMovie.

    DATA ratings TYPE TABLE FOR CREATE ZR_13_MovieTP\_Ratings.
    data(valid_keys) = keys.

    " Process Movie-Keys
    LOOP AT keys INTO data(key).
      "Validate Rating
      IF key-%param-Rating < 1 or key-%param-Rating > 10.
        " Create Error Message
        data(message) = new zcm_abap_movie( textid = zcm_abap_movie=>invalid_rating
                                            rating = key-%param-rating
                                            severity = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky = key-%tky
                        %msg = message
                        %action-RateMovie = if_abap_behv=>mk-on ) to reported-movie.
        APPEND VALUE #( %tky = key-%tky ) to failed-movie.
        DELETE valid_keys WHERE %tky = key-%tky.
      ENDIF.
    ENDLOOP.


    " Check Movie-Keys
    IF valid_keys IS INITIAL.
      RETURN.
    ENDIF.

    "Create Ratings
    LOOP AT valid_keys INTO key.
      APPEND VALUE #( %tky = key-%tky
                      %target = value #( ( Rating = key-%param-Rating ) ) ) to ratings.
    ENDLOOP.

    " Create Ratings
    MODIFY ENTITIES OF ZR_13_MovieTP IN LOCAL MODE
      ENTITY Movie
      CREATE BY \_Ratings
      AUTO FILL CID
      FIELDS ( Rating )
      WITH ratings.

  ENDMETHOD.

ENDCLASS.
