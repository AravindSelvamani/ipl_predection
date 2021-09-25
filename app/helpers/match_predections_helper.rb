module MatchPredectionsHelper
  MATCH_SCHEDULE = {
    '9-Apr-21'=>  [ {'team1' =>'Mumbai Indians', 'team2'=>'Royal Challengers Bangalore', 'start_time'=>'14:00'}],
    '10-Apr-21'=>  [ {'team1' =>'Chennai Super Kings', 'team2'=>'Delhi Capitals', 'start_time'=>'14:00'}],
    '11-Apr-21'=>  [ {'team1' =>'Sunrisers Hyderabad', 'team2'=>'Kolkata Knight Riders', 'start_time'=>'14:00'}],
    '12-Apr-21'=>  [ {'team1' =>'Rajasthan Royals', 'team2'=>'Punjab Kings', 'start_time'=>'14:00'}],
    '13-Apr-21'=>  [ {'team1' =>'Kolkata Knight Riders', 'team2'=>'Mumbai Indians', 'start_time'=>'14:00'}],
    '14-Apr-21'=>  [ {'team1' =>'Sunrisers Hyderabad', 'team2'=>'Royal Challengers Bangalore', 'start_time'=>'14:00'}],
    '15-Apr-21'=>  [ {'team1' =>'Rajasthan Royals', 'team2'=>'Delhi Capitals', 'start_time'=>'14:00'}],
    '16-Apr-21'=>  [ {'team1' =>'Punjab Kings', 'team2'=>'Chennai Super Kings', 'start_time'=>'14:00'}],
    '17-Apr-21'=>  [ {'team1' =>'Mumbai Indians', 'team2'=>'Sunrisers Hyderabad', 'start_time'=>'14:00'}],
    '18-Apr-21'=>  [ {'team1' =>'Royal Challengers Bangalore', 'team2'=>'Kolkata Knight Riders', 'start_time'=>'10:00'},
                    {'team1' =>'Delhi Capitals', 'team2'=>'Punjab Kings', 'start_time'=>'14:00'}],
    '19-Apr-21'=>  [ {'team1' =>'Chennai Super Kings', 'team2'=>'Rajasthan Royals', 'start_time'=>'14:00'}],
    '20-Apr-21'=>  [ {'team1' =>'Delhi Capitals', 'team2'=>'Mumbai Indians', 'start_time'=>'14:00'}],
    '21-Apr-21'=>  [ {'team1' =>'Punjab Kings', 'team2'=>'Sunrisers Hyderabad', 'start_time'=>'10:00'},
                    {'team1' =>'Kolkata Knight Riders', 'team2'=>'Chennai Super Kings', 'start_time'=>'14:00'}],
    '22-Apr-21'=>  [ {'team1' =>'Royal Challengers Bangalore', 'team2'=>'Rajasthan Royals', 'start_time'=>'14:00'}],
    '23-Apr-21'=>  [ {'team1' =>'Punjab Kings', 'team2'=>'Mumbai Indians', 'start_time'=>'14:00'}],
    '24-Apr-21'=>  [ {'team1' =>'Rajasthan Royals', 'team2'=>'Kolkata Knight Riders', 'start_time'=>'14:00'}],
    '25-Apr-21'=>  [ {'team1' =>'Chennai Super Kings', 'team2'=>'Royal Challengers Bangalore', 'start_time'=>'10:00'},
                    {'team1' =>'Sunrisers Hyderabad', 'team2'=>'Delhi Capitals', 'start_time'=>'14:00'}],
    '26-Apr-21'=>  [ {'team1' =>'Punjab Kings', 'team2'=>'Kolkata Knight Riders', 'start_time'=>'14:00'}],
    '27-Apr-21'=>  [ {'team1' =>'Delhi Capitals', 'team2'=>'Royal Challengers Bangalore', 'start_time'=>'14:00'}],
    '28-Apr-21'=>  [ {'team1' =>'Chennai Super Kings', 'team2'=>'Sunrisers Hyderabad', 'start_time'=>'14:00'}],
    '29-Apr-21'=>  [ {'team1' =>'Mumbai Indians', 'team2'=>'Rajasthan Royals', 'start_time'=>'10:00'},
                    {'team1' =>'Delhi Capitals', 'team2'=>'Kolkata Knight Riders', 'start_time'=>'14:00'}],
    '30-Apr-21'=>  [ {'team1' =>'Punjab Kings', 'team2'=>'Royal Challengers Bangalore', 'start_time'=>'14:00'}],
    '1-May-21'=>  [ {'team1' =>'Mumbai Indians', 'team2'=>'Chennai Super Kings', 'start_time'=>'14:00'}],
    '2-May-21'=>  [ {'team1' =>'Rajasthan Royals', 'team2'=>'Sunrisers Hyderabad', 'start_time'=>'10:00'},
                    {'team1' =>'Punjab Kings', 'team2'=>'Delhi Capitals', 'start_time'=>'14:00'}],
    '19-Sep-21'=>  [ {'team1' =>'Chennai Super Kings', 'team2'=>'Mumbai Indians', 'start_time'=>'14:00'}],
    '20-Sep-21'=>  [ {'team1' =>'Kolkata Knight Riders', 'team2'=>'Royal Challengers Bangalore', 'start_time'=>'14:00'}],
    '21-Sep-21'=>  [ {'team1' =>'Punjab Kings', 'team2'=>'Rajasthan Royals', 'start_time'=>'14:00'}],
    '22-Sep-21'=>  [ {'team1' =>'Delhi Capitals', 'team2'=>'Sunrisers Hyderabad', 'start_time'=>'14:00'}],
    '23-Sep-21'=>  [ {'team1' =>'Mumbai Indians', 'team2'=>'Kolkata Knight Riders', 'start_time'=>'14:00'}],
    '24-Sep-21'=>  [ {'team1' =>'Royal Challengers Bangalore', 'team2'=>'Chennai Super Kings', 'start_time'=>'14:00'}],
    '25-Sep-21'=>  [ {'team1' =>'Delhi Capitals', 'team2'=>'Rajasthan Royals', 'start_time'=>'10:00'},
                      {'team1' =>'Sunrisers Hyderabad', 'team2'=>'Punjab Kings', 'start_time'=>'14:00'}],
    '26-Sep-21'=>  [ {'team1' =>'Chennai Super Kings', 'team2'=>'Kolkata Knight Riders', 'start_time'=>'10:00'},
                      {'team1' =>'Royal Challengers Bangalore', 'team2'=>'Mumbai Indians', 'start_time'=>'14:00'}],
    '27-Sep-21'=>  [ {'team1' =>'Sunrisers Hyderabad', 'team2'=>'Rajasthan Royals', 'start_time'=>'14:00'}],
    '28-Sep-21'=>  [ {'team1' =>'Kolkata Knight Riders', 'team2'=>'Delhi Capitals', 'start_time'=>'10:00'},
                      {'team1' =>'Mumbai Indians', 'team2'=>'Punjab Kings', 'start_time'=>'14:00'}],
    '29-Sep-21'=>  [ {'team1' =>'Rajasthan Royals', 'team2'=>'Royal Challengers Bangalore', 'start_time'=>'14:00'}],
    '30-Sep-21'=>  [ {'team1' =>'Sunrisers Hyderabad', 'team2'=>'Chennai Super Kings', 'start_time'=>'14:00'}],
    '1-Oct-21'=>    [ {'team1' =>'Kolkata Knight Riders', 'team2'=>'Punjab Kings', 'start_time'=>'14:00'}],
    '2-Oct-21'=>    [ {'team1' =>'Mumbai Indians', 'team2'=>'Delhi Capitals', 'start_time'=>'10:00'},
                      {'team1' =>'Rajasthan Royals', 'team2'=>'Chennai Super Kings', 'start_time'=>'14:00'}],
    '3-Oct-21'=>    [ {'team1' =>'Royal Challengers Bangalore', 'team2'=>'Punjab Kings', 'start_time'=>'10:00'},
                      {'team1' =>'Kolkata Knight Riders', 'team2'=>'Sunrisers Hyderabad', 'start_time'=>'14:00'}],
    '4-Oct-21'=>  [ {'team1' =>'Delhi Capitals', 'team2'=>'Chennai Super Kings', 'start_time'=>'14:00'}],
    '5-Oct-21'=>  [ {'team1' =>'Rajasthan Royals', 'team2'=>'Mumbai Indians', 'start_time'=>'14:00'}],
    '6-Oct-21'=>  [ {'team1' =>'Royal Challengers Bangalore', 'team2'=>'Sunrisers Hyderabad', 'start_time'=>'14:00'}],
    '7-Oct-21'=>    [ {'team1' =>'Chennai Super Kings', 'team2'=>'Punjab Kings', 'start_time'=>'10:00'},
                      {'team1' =>'Kolkata Knight Riders', 'team2'=>'Rajasthan Royals', 'start_time'=>'14:00'}],
    '8-Oct-21'=>    [ {'team1' =>'Sunrisers Hyderabad', 'team2'=>'Mumbai Indians', 'start_time'=>'10:00'},
                      {'team1' =>'Royal Challengers Bangalore', 'team2'=>'Delhi Capitals', 'start_time'=>'14:00'}]
    # '10-May-21'=>  [ {'team1' =>'', 'team2'=>'', 'start_time'=>'14:00'}],
    # '11-May-21'=>  [ {'team1' =>'', 'team2'=>'', 'start_time'=>'14:00'}],
    # '13-May-21'=>  [ {'team1' =>'', 'team2'=>'', 'start_time'=>'14:00'}],
    # '15-May-21'=>  [ {'team1' =>'', 'team2'=>'', 'start_time'=>'14:00'}]
  }

  TEAM_COLOR = {
    'Mumbai Indians' => '#004ba0',
    'Chennai Super Kings' => '#fcce06',
    'Kolkata Knight Riders' => '#3a225d',
    'Punjab Kings'=> '#f04a4a',
    'Rajasthan Royals'=>'#e73895',
    'Delhi Capitals'=>'#00008b',
    'Sunrisers Hyderabad'=>'#FF822A',
    'Royal Challengers Bangalore' => '#d5152c'
   }

   def self.get_date
      today = Time.now.in_time_zone("Chennai").strftime("%-d-%b-%y")
      match_start_date = "9-Apr-21"
      Date.parse(today) >= Date.parse(match_start_date) ? today : match_start_date
   end
end
