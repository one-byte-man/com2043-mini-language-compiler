GO
    NUM x ;
    DECIMAL y = 5.5;
    CHAR z = 'a';
    x = 10 + 5;
    
    IF (x > 5 $ y < 10) >>
        SHOW (z);
        NUM k;
        k = x * 2; 

        IF (k / 5 == 6) >>
            SHOW (k+5);
        <<
    <<

    LOOP y > 1 >> 
        y = y - 1;

        IF (y != 5.5) >>
            SHOW (y);
        <<
    <<

    IF ( y == 5.5 # x < 5.5) >>
        SHOW (x*5);
        SHOW (y/(x-1));
    <<
    ELSE >>
        SHOW (z);
    <<
STOP