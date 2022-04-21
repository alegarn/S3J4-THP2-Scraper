#require 'rubygems'
#require 'nokogiri'
#require 'open-uri'
#require 'pry'

def essone_scraper(link,city_name,city_email)

  page = Nokogiri::HTML(URI(link).open())

  news_links = page.css("p a.lientxt")
  i = 0
  news_links.each { |link|

    city_name << link.text

  begin
    href = link['href'].delete_prefix("./")

    city = "https://annuaire-des-mairies.com/#{href}"
    adress = '/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]'
    page = Nokogiri::HTML(URI(city).open())

      page.xpath(adress).each do |node|
        puts link.text + ' ' + node.text
        if node.text == ""
          city_email << "pas d'email"
        else
          city_email << node.text
        end

      end

  rescue

    puts '404'
    city_email << "pas d'email"

  end
  }

  return [city_name, city_email]
end

def perform

  puts "                                                     LL         EEEEEEEEE
                                                     LL         EEEEEEEEE
                                                     LL         EE
                                                     LL         EE
                                                     LL         EEEEEEEE
                                                     LL         EE
                                                     LL         EE
                                                     LLLLLLLLL  EEEEEEEEE
                                                     LLLLLLLLL  EEEEEEEEE

     SSSSSSSS      A       CCCCCCCC  RRRRRRR    EEEEEEEEE              CCCCCCCC   OOOOOOO   EEEEEEEEE  UU     UU  RRRRRRR
    SSSSSSSSS     A A     CCCCCCCCC  RRRRRRRR   EEEEEEEEE             CCCCCCCCC  OOOOOOOOO  EEEEEEEEE  UU     UU  RRRRRRRR
    SS           AA AA    CC         RR     RR  EE                    CC         OO     OO  EE         UU     UU  RR     RR
    SSS         AA   AA   CC         RR     RR  EE         ---------  CC         OO     OO  EE         UU     UU  RR     RR
     SSSSSSS    AAAAAAA   CC         RRRRRRRR   EEEEEEEE   ---------  CC         OO     OO  EEEEEEEE   UU     UU  RRRRRRRR
          SSS  AA     AA  CC         RR  RR     EE         ---------  CC         OO     OO  EE         UU     UU  RR  RR
           SS  AA     AA  CC         RR   RR    EE                    CC         OO     OO  EE         UU     UU  RR   RRR
    SSSSSSSSS  AA     AA  CCCCCCCCC  RR    RR   EEEEEEEEE             CCCCCCCCC  OOOOOOOOO  EEEEEEEEE  UUUUUUUUU  RR    RR
    SSSSSSSS   AA     AA   CCCCCCCC  RR     RR  EEEEEEEEE              CCCCCCCC   OOOOOOO   EEEEEEEEE   UUUUUUU   RR     RR

                                                               !
                                                              * *
                                                             *   *
                                                            *     *
                                                            =======
                                                            *     *
                                                            * 111 *
                                                            *     *
                                                            * -O- *
                                                            =======
                                                            *     *
                                                            *     *
                                                           *       *
                                                         **         **
                                                       **             **
                                                     **                 **
                                                   **                     **
                                                  *                         *
                                                 *                           *
                                                *                             *
                                               *                               *
                                               *                               *
                                              *                                 *
                                              *                                 *
                                              *                                 *
                                   !         *                                   *         !
                                  * *        *         -----------------         *        * *
                                 *   *       *   ------ 111   111   111 ------   *       *   *
                                 =====     <-----  111                   111  ----->     =====
                                 *   *     *  111                             111  *     *   *
                                 *!!!*     *W          -----------------          W*     *!!!*
                                 *!!!*     *     ------^^^^^^^^^^^^^^^^^------     *     *!!!*
                                 =====     ------^^^^^^                 ^^^^^^------     =====
                                 *   *   / ^^^^^^                             ^^^^^^ \   *   *
                                *     *  \                   .,-,.                .  /  *     *
                              **       **          ^X^  ^X^./     \.^X^  ^X^          **       **
                            **           ** $ ^X^  XXX  XX/  .---.  \XX  XXX  ^X^ $ **           **
                           *               / \JXX  XXX  XX1 /X2X2X\ 1XX  XXX  XXE/ \               *
                          *               /   \XX  XXX  XX1 1YIOIX1 1XX  XXX  XX/   \               *
                          *              1     1X  XXX  /M1#1/   \1#1M\  XXX  X1     1              *
                         *               =======X     /M  1 1!   !1 1  M\     X=======               *
                         *               1     1    /M    1 1!   !1 1    M\    1     1               *
                         *               1! I !1  /M      1 1Y   Y1 1      M\  1! I !1               *
                         *      -------  1! I !1/M        1 1Y   Y1 1        M\1! I !1  -------      *
                         *  ---- ^^^^^ --1     1          ===C! !Y===          1     1-- ^^^^^ ----  *
                        <---^^^         ^1     1          / 1-----1 \          1     1^         ^^^--->
                         ^^^     XX XX   =======----------===========----------=======   XX XX     ^^^
                         !  X X  XX XX  X1     1^^^^^^^^^1           1^^^^^^^^^1     1X  XX XX  X X  !
                --       !  X X  XX XX  X1  X  1   ====   1  .---.  1   ====   1  X  1X  XX XX  X X  !       --
                11-11-11* * X X         X1  X  1 //YYYY\\ 1 / ^X^ \ 1 //YYYY\\ 1  X  1X         X X * *11-11-11
                1      *   *             1     1 U1   O1U 1 1 XXX 1 1 U1O   1U 1     1             *   *      1
                ======#=====    =======  =======T== . .====== XXX ======. . ==T=======  =======    =====#======
                1     #1^  1====       ==1     1  #    #  1#  XXX  #1  #    #  1     1==       ====1  ^1#     1
                1  X   / \ 1             1  @  1  1----1  1.  XXX  .1  1----1  1  @  1             1 / \   X  1
                1  X  =====1   ..---..   1  1   ..---..   1=====  X  1
                /     1   11  /  ^ ^  \  11  /  ^ ^  \  11   1     \
               =======1   11 /    \ 1 \X/ 1  1 XX 1  1..     ..1  1 XX 1  1 \X/ 1 /    \ 11   1=======
               1   .  1 ===1 1    1 1 I I 1  1 XX 1 .1..     ..1. 1 XX 1  1 I I 1 1    1 1=== 1  .   1
               1 .   .1  .11 1   V V   1 ===== 1  1 XX 1 ...   #   ... 1 XX 1  1 ===== 1   V V   1 11.  1.   . 1
               1.     1------------------#   #-----------------------------------#   #------------------1     .1
               1.     1       @          1   1                                   1   1          @       1     .1
               1.     1======XXX=========1   1^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^1   1=========XXX======1     .1
             ---. --  1     1\X/    ....11   1                                   1   11....    \X/      1  -- .---
             1======= 1     1=I=======..11   1                                   1   11..=======I=1     1 =======1
             /  .    .1 === 1 I        .11===1   ..---..    ..---..    ..---..   1===11.        I 1 === 1.    .  \
            =====    .11    1 I  XX     11   1  /XXXXXXX\  /XXXXXXX\  /XXXXXXX\  1   11     XX  I 1    11.    =====
            1   .    .11    1 I  XX     11   1  1XXXXXXX1  1XXXXXXX1  1XXXXXXX1  1   11     XX  I 1    11.    .   1
            1   .    .11    1 IX XX X   11   1  1XXXXXXX1  1XXXXXXX1  1XXXXXXX1  1   11   X XX XI 1    11.    .   1
            1   .    .11    1 IX XX X   11   -------=======================-------   11   X XX XI 1    11.    .   1
            1   .    .11    1 IX X===========       1111111 1111111 1111111       ===========X XI 1    11.    .   1
    -----=======-------===========1111 111111                                     111111 1111===========-------=======-----
         1111111       1111111 111           -------------------------------------           111 1111111       1111111
                                  -----------,,,,,,,,,,,,,,,,,,^,,,,,,,,,,,,,,,,,,-----------
    ------------------------------,,,,,,,,,,,1     1          ! !          1     1,,,,,,,,,,,------------------------------
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,           =======          ! !          =======           ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
                1     1                      1     1                       1     1                      1     1
                =======       .---X---.      1     1       .---X---.       1     1      .---X---.       =======
                1     1      /XXXXXXXXX\     1     1      /XXXXXXXXX\      1     1     /XXXXXXXXX\      1     1
                1     1     /XXXXXXXXXXX\    1     1     /XXXXXXXXXXX\     1     1    /XXXXXXXXXXX\     1     1
                1     1    1XXXXXXXXXXXXX1   1     1    1XXXXXXXXXXXXX1    1     1   1XXXXXXXXXXXXX1    1     1
                1     1    1XXXXXXXXXXXXX1   1     1    1XXXXXXXXXXXXX1    1     1   1XXXXXXXXXXXXX1    1     1
    -----------------------------------------------------------------------------------------------------------------------

9897 "

  puts 'ScrapBot_email - Démarrer la récupération des noms et adresses des mairies (91)?'
  print "Appuyer sur entrée pour démarrer / CTRL+Z pour arrêter: "
  gets.chomp

  city_name = []
  city_email = []
  link = "https://annuaire-des-mairies.com/essonne.html"
  arrays = essone_scraper(link,city_name,city_email)

  city_name = city_name + arrays[0]
  city_email = city_email + arrays[1]
  data = Hash[city_name.zip city_email]

  puts data
  without_adress = []
  data.each{ |key, value|
  if value == "pas d'email"
    without_adress << key
  end
  }
  puts "

  Sans email:"
  without_adress.each { |mail| puts mail}

end

perform()
