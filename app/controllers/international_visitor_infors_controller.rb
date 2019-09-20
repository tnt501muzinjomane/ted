class InternationalVisitorInforsController < ApplicationController
  before_action :set_international_visitor_infor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index

 @user = User.where(:id =>  params[:search])
 @users = User.all




 if params[:search] == ''

   $edu1 = Reason.where('citizen = ? AND reason = ?  AND rdate BETWEEN ? AND ?', "Nonswazi", "Educational", params[:start_date], params[:end_date]).sum(:nump)

         $recre1 = Reason.where('citizen = ? AND reason = ?  AND rdate BETWEEN ? AND ?', "Nonswazi", "Recreation/leisure", params[:start_date], params[:end_date]).sum(:nump)


         $rese1 = Reason.where('citizen = ? AND reason = ?  AND rdate BETWEEN ? AND ?', "Nonswazi", "Research", params[:start_date], params[:end_date]).sum(:nump)
         
         $other1 = Reason.where('citizen = ? AND reason = ?  AND rdate BETWEEN ? AND ?', "Nonswazi", "Other", params[:start_date], params[:end_date]).sum(:nump)



          

        
           @chart177 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Reasons for visit")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Educational", :yAxis => 0, :data => [$edu1])
          f.series(:name => "Recreation/leisure", :yAxis => 0, :data => [$recre1])
          f.series(:name => "Research", :yAxis => 0, :data => [$rese1])
          f.series(:name => "Other", :yAxis => 0, :data => [$other1])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



       $a11 = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:start_date], params[:end_date]).sum(:Below_18)
        $a22 = VisitorInfo.where('citizenship = ? AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:start_date], params[:end_date]).sum(:age18_24)
        $a33 = VisitorInfo.where('citizenship = ? AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:start_date], params[:end_date]).sum(:age25_34)
        $a44 = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:start_date], params[:end_date]).sum(:age35_44)
        $a55 = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:start_date], params[:end_date]).sum(:age45_54)
        $a66 = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:start_date], params[:end_date]).sum(:age55_64)
        $a77 = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:start_date], params[:end_date]).sum(:age65)


        @chart161 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Age group")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Below 18", :yAxis => 0, :data => [$a11])
          f.series(:name => "18-24", :yAxis => 0, :data => [$a22])
          f.series(:name => "25-34", :yAxis => 0, :data => [$a33])
          f.series(:name => "35-44", :yAxis => 0, :data => [$a44])
          f.series(:name => "45-54", :yAxis => 0, :data => [$a55])
          f.series(:name => "55-64", :yAxis => 0, :data => [$a66])
          f.series(:name => "65 + above", :yAxis => 0, :data => [$a77])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



      @d = VisitorInfo.where('travel = ? AND citizenship = ? AND date_of_arrival BETWEEN ? AND ?', 'individual', 'Nonswazi', params[:start_date], params[:end_date]).sum(:male)

      @d1 = VisitorInfo.where('travel = ? AND citizenship = ? AND date_of_arrival BETWEEN ? AND ?', 'individual', 'Nonswazi', params[:start_date], params[:end_date]).sum(:female)

     $j = @d + @d1


     @d2 = VisitorInfo.where('travel = ? AND citizenship = ? AND date_of_arrival BETWEEN ? AND ?', 'group', 'Nonswazi', params[:start_date], params[:end_date]).sum(:female)

     @d12 = VisitorInfo.where('travel = ? AND citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'group', 'Nonswazi', params[:start_date], params[:end_date]).sum(:male)

     $k =  @d2 + @d12


        @chart701 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Type of visitors")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Individual", :yAxis => 0, :data => [$j])
	  f.series(:name => "Group", :yAxis => 0, :data => [$k])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



    

$pars = Partnership.where('partnership = ? AND citizen = ?  AND rdate BETWEEN ? AND ?', 'Alone', 'Nonswazi', params[:start_date], params[:end_date]).sum(:nump)
       

        $pars1 = Partnership.where('partnership = ? AND citizen = ? AND rdate BETWEEN ? AND ?', 'With spouse/partner', 'Nonswazi', params[:start_date], params[:end_date]).sum(:nump)
       

       



        $pars2 = Partnership.where('partnership = ? AND citizen = ?  AND rdate BETWEEN ? AND ?', 'With colleagues', 'Nonswazi', params[:start_date], params[:end_date]).sum(:nump)
        

        

        $pars3 = Partnership.where('partnership = ? AND citizen = ? AND rdate BETWEEN ? AND ?', 'With friends & relatives', 'Nonswazi', params[:start_date], params[:end_date]).sum(:nump)
        

        $pars4 = Partnership.where('partnership = ? AND citizen = ? AND rdate BETWEEN ? AND ?', 'With family', 'Nonswazi', params[:start_date], params[:end_date]).sum(:nump)
                

       

        $pars5 = Partnership.where('partnership = ? AND citizen = ?  AND rdate BETWEEN ? AND ?', 'With children', 'Nonswazi', params[:start_date], params[:end_date]).sum(:nump)
        

        $pars6 = Partnership.where('partnership = ? AND citizen = ?  AND rdate BETWEEN ? AND ?', 'Packaged tour', 'Nonswazi', params[:start_date], params[:end_date]).sum(:nump)
        

        


        $pars7 = Partnership.where('partnership = ? AND citizen = ? AND rdate BETWEEN ? AND ?', 'School tour', 'Nonswazi', params[:start_date], params[:end_date]).sum(:nump)
        

        

        
        $pars8 = Partnership.where('partnership = ? AND citizen = ? AND rdate BETWEEN ? AND ?', 'Other', 'Nonswazi', params[:start_date], params[:end_date]).sum(:nump)
       

        
      
      
         @chart630 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Travel partnership")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Alone", :yAxis => 0, :data => [$pars])
	  f.series(:name => "With spouse/partner", :yAxis => 0, :data => [$pars1])
          f.series(:name => "With colleagues", :yAxis => 0, :data => [$pars2])
          f.series(:name => "With friends & relatives", :yAxis => 0, :data => [$pars3])



          f.series(:name => "With family", :yAxis => 0, :data => [$pars4])
          f.series(:name => "With children", :yAxis => 0, :data => [$pars5])
          f.series(:name => "Packaged tour", :yAxis => 0, :data => [$pars6])
          f.series(:name => "School tour", :yAxis => 0, :data => [$pars7])
          f.series(:name => "Other", :yAxis => 0, :data => [$pars8])


	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



       $yy = VisitorInfo.where('citizenship = ? AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:start_date], params[:end_date]).sum(:male)
    $zz = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:start_date], params[:end_date]).sum(:female)

    


    @chart15 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Gender")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Male visitors", :yAxis => 0, :data => [$yy])
          f.series(:name => "Female visitors", :yAxis => 0, :data => [$zz])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



     @c = Country.where('name != ? AND datev BETWEEN ? AND ?', "Swaziland", params[:start_date], params[:end_date]).order('name')



    # @c = Country.where({datev: (params[:start_date]).. (params[:end_date])}).order('name')
   

   $x = InternationalVisitorInfor.where('rdate BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:africa)
   $x1 = InternationalVisitorInfor.where('rdate BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:america)
   $x2 = InternationalVisitorInfor.where('rdate BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:asia)
   $x3 = InternationalVisitorInfor.where('rdate BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:europe)

   

    @chart12 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Arrival by continent")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Africa", :yAxis => 0, :data => [$x])
          f.series(:name => "America", :yAxis => 0, :data => [$x1])
          f.series(:name => "Asia", :yAxis => 0, :data => [$x2])
          f.series(:name => "Europe", :yAxis => 0, :data => [$x3])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end




        
        $d23 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'South Africa', params[:start_date], params[:end_date]).sum(:num_v)
        $d24 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Mozambique', params[:start_date], params[:end_date]).sum(:num_v)
        $d25 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Botswana', params[:start_date], params[:end_date]).sum(:num_v)
        $d26 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Lesotho', params[:start_date], params[:end_date]).sum(:num_v)
        $d27 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Germany', params[:start_date], params[:end_date]).sum(:num_v)
        $d28 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Netherlands', params[:start_date], params[:end_date]).sum(:num_v)
        $d29 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'United Kingdom', params[:start_date], params[:end_date]).sum(:num_v)
        $d30 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'France', params[:start_date], params[:end_date]).sum(:num_v)
        $d31 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Potugal', params[:start_date], params[:end_date]).sum(:num_v)
        $d32 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Switzerland', params[:start_date], params[:end_date]).sum(:num_v)
        $d33 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Australia', params[:start_date], params[:end_date]).sum(:num_v)
        
        $d34 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'New Zealand', params[:start_date], params[:end_date]).sum(:num_v)
        $d35 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'China', params[:start_date], params[:end_date]).sum(:num_v)
        $d36 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'India', params[:start_date], params[:end_date]).sum(:num_v)
        $d37 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Taiwan', params[:start_date], params[:end_date]).sum(:num_v)
        $d38 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'United States', params[:start_date], params[:end_date]).sum(:num_v)
        $d39 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Canada', params[:start_date], params[:end_date]).sum(:num_v)
        $d40 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Mexico', params[:start_date], params[:end_date]).sum(:num_v)
        $d41 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Russia', params[:start_date], params[:end_date]).sum(:num_v)
        $d42 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Angola', params[:start_date], params[:end_date]).sum(:num_v)
        $d43 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Brazil', params[:start_date], params[:end_date]).sum(:num_v)
        $d44 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Japan', params[:start_date], params[:end_date]).sum(:num_v)
        $d45 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'United Arab Emirates', params[:start_date], params[:end_date]).sum(:num_v)
        $d46 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Argentina', params[:start_date], params[:end_date]).sum(:num_v)
        $d47 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Afghanistan', params[:start_date], params[:end_date]).sum(:num_v)
        $d48 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Zambia', params[:start_date], params[:end_date]).sum(:num_v)
        $d49 = Country.where('name = ? AND datev BETWEEN ? AND ?', 'Zimbabwe', params[:start_date], params[:end_date]).sum(:num_v)




  
        @chart550 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Arrival by country")
	  f.xAxis(:categories => ["Number of visitors"])
         
          f.series(:name => "South Africa", :yAxis => 0, :data => [$d23])
          f.series(:name => "Mozambique", :yAxis => 0, :data => [$d24])
          f.series(:name => "Botswana", :yAxis => 0, :data => [$d25])
          f.series(:name => "Lesotho", :yAxis => 0, :data => [$d26])
          f.series(:name => "Germany", :yAxis => 0, :data => [$d27])
          f.series(:name => "Netherlands", :yAxis => 0, :data => [$d28])
          f.series(:name => "United Kingdom", :yAxis => 0, :data => [$d29])
          f.series(:name => "France", :yAxis => 0, :data => [$d30])
          f.series(:name => "Portugal", :yAxis => 0, :data => [$d31])
          f.series(:name => "Switzerland", :yAxis => 0, :data => [$d32])
          f.series(:name => "Australia", :yAxis => 0, :data => [$d33])
          f.series(:name => "New Zealand", :yAxis => 0, :data => [$d34])
          f.series(:name => "China", :yAxis => 0, :data => [$d35])
          f.series(:name => "India", :yAxis => 0, :data => [$d36])
          f.series(:name => "Taiwan", :yAxis => 0, :data => [$d37])
          f.series(:name => "United States", :yAxis => 0, :data => [$d38])
          f.series(:name => "Canada", :yAxis => 0, :data => [$d39])
          f.series(:name => "Mexico", :yAxis => 0, :data => [$d40])
          f.series(:name => "Russia", :yAxis => 0, :data => [$d41])
          f.series(:name => "Angola", :yAxis => 0, :data => [$d42])
          f.series(:name => "Brazil", :yAxis => 0, :data => [$d43])
          f.series(:name => "Japan", :yAxis => 0, :data => [$d44])
          f.series(:name => "United Arab Emirates", :yAxis => 0, :data => [$d45])
          f.series(:name => "Argentina", :yAxis => 0, :data => [$d46])
          f.series(:name => "Afghanistan", :yAxis => 0, :data => [$d47])
          f.series(:name => "Zambia", :yAxis => 0, :data => [$d48])
          f.series(:name => "Zimbabwe", :yAxis => 0, :data => [$d49])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



    @international_visitor_infors = InternationalVisitorInfor.all
    respond_with(@international_visitor_infors)


else

   
        $d23 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'South Africa', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d24 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Mozambique', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d25 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Botswana', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d26 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Lesotho', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d27 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Germany', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d28 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Netherlands', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d29 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'United Kingdom', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d30 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'France', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d31 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Potugal', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d32 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Switzerland', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d33 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Australia', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        
        $d34 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'New Zealand', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d35 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'China', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d36 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'India', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d37 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Taiwan', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d38 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'United States', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d39 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Canada', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d40 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Mexico', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d41 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Russia', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d42 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Angola', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d43 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Brazil', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d44 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Japan', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d45 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'United Arab Emirates', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d46 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Argentina', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d47 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Afghanistan', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d48 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Zambia', params[:search], params[:start_date], params[:end_date]).sum(:num_v)
        $d49 = Country.where('name = ? AND user_id = ? AND datev BETWEEN ? AND ?', 'Zimbabwe', params[:search], params[:start_date], params[:end_date]).sum(:num_v)




  
        @chart550 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Arrival by country")
	  f.xAxis(:categories => ["Number of visitors"])
         
          f.series(:name => "South Africa", :yAxis => 0, :data => [$d23])
          f.series(:name => "Mozambique", :yAxis => 0, :data => [$d24])
          f.series(:name => "Botswana", :yAxis => 0, :data => [$d25])
          f.series(:name => "Lesotho", :yAxis => 0, :data => [$d26])
          f.series(:name => "Germany", :yAxis => 0, :data => [$d27])
          f.series(:name => "Netherlands", :yAxis => 0, :data => [$d28])
          f.series(:name => "United Kingdom", :yAxis => 0, :data => [$d29])
          f.series(:name => "France", :yAxis => 0, :data => [$d30])
          f.series(:name => "Portugal", :yAxis => 0, :data => [$d31])
          f.series(:name => "Switzerland", :yAxis => 0, :data => [$d32])
          f.series(:name => "Australia", :yAxis => 0, :data => [$d33])
          f.series(:name => "New Zealand", :yAxis => 0, :data => [$d34])
          f.series(:name => "China", :yAxis => 0, :data => [$d35])
          f.series(:name => "India", :yAxis => 0, :data => [$d36])
          f.series(:name => "Taiwan", :yAxis => 0, :data => [$d37])
          f.series(:name => "United States", :yAxis => 0, :data => [$d38])
          f.series(:name => "Canada", :yAxis => 0, :data => [$d39])
          f.series(:name => "Mexico", :yAxis => 0, :data => [$d40])
          f.series(:name => "Russia", :yAxis => 0, :data => [$d41])
          f.series(:name => "Angola", :yAxis => 0, :data => [$d42])
          f.series(:name => "Brazil", :yAxis => 0, :data => [$d43])
          f.series(:name => "Japan", :yAxis => 0, :data => [$d44])
          f.series(:name => "United Arab Emirates", :yAxis => 0, :data => [$d45])
          f.series(:name => "Argentina", :yAxis => 0, :data => [$d46])
          f.series(:name => "Afghanistan", :yAxis => 0, :data => [$d47])
          f.series(:name => "Zambia", :yAxis => 0, :data => [$d48])
          f.series(:name => "Zimbabwe", :yAxis => 0, :data => [$d49])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end
        










           $edu1 = Reason.where('citizen = ? AND user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', "Nonswazi", params[:search], "Educational", params[:start_date], params[:end_date]).sum(:nump)

         $recre1 = Reason.where('citizen = ? AND user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', "Nonswazi", params[:search], "Recreation/leisure", params[:start_date], params[:end_date]).sum(:nump)


         $rese1 = Reason.where('citizen = ? AND user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', "Nonswazi", params[:search], "Research", params[:start_date], params[:end_date]).sum(:nump)
         
         $other1 = Reason.where('citizen = ? AND user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', "Nonswazi", params[:search], "Other", params[:start_date], params[:end_date]).sum(:nump)



          

        
           @chart177 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Reasons for visit")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Educational", :yAxis => 0, :data => [$edu1])
          f.series(:name => "Recreation/leisure", :yAxis => 0, :data => [$recre1])
          f.series(:name => "Research", :yAxis => 0, :data => [$rese1])
          f.series(:name => "Other", :yAxis => 0, :data => [$other1])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



       $a11 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:Below_18)
        $a22 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:age18_24)
        $a33 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:age25_34)
        $a44 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:age35_44)
        $a55 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:age45_54)
        $a66 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:age55_64)
        $a77 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:age65)


        @chart161 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Age group")
	  f.xAxis(:categories => ["Age group"])
          f.series(:name => "Below 18", :yAxis => 0, :data => [$a11])
          f.series(:name => "18-24", :yAxis => 0, :data => [$a22])
          f.series(:name => "25-34", :yAxis => 0, :data => [$a33])
          f.series(:name => "35-44", :yAxis => 0, :data => [$a44])
          f.series(:name => "45-54", :yAxis => 0, :data => [$a55])
          f.series(:name => "55-64", :yAxis => 0, :data => [$a66])
          f.series(:name => "65 + above", :yAxis => 0, :data => [$a77])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



      @d = VisitorInfo.where('travel = ? AND citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'individual', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:male)

      @d1 = VisitorInfo.where('travel = ? AND citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'individual', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:female)

     $j = @d + @d1


     @d2 = VisitorInfo.where('travel = ? AND citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'group', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:female)

     @d12 = VisitorInfo.where('travel = ? AND citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'group', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:male)

     $k =  @d2 + @d12


        @chart701 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Type of visitors")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Individual", :yAxis => 0, :data => [$j])
	  f.series(:name => "Group", :yAxis => 0, :data => [$k])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



    

$pars = Partnership.where('partnership = ? AND citizen = ? AND user_id = ?  AND rdate BETWEEN ? AND ?', 'Alone', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:nump)
     


        $pars1 = Partnership.where('partnership = ? AND citizen = ? AND user_id = ?  AND rdate BETWEEN ? AND ?', 'With spouse/partner', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:nump)
        

       



        $pars2 = Partnership.where('partnership = ? AND citizen = ? AND user_id = ?  AND rdate BETWEEN ? AND ?', 'With colleagues', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:nump)
        

        

        $pars3 = Partnership.where('partnership = ? AND citizen = ? AND user_id = ?  AND rdate BETWEEN ? AND ?', 'With friends & relatives', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:nump)
       
        

        $pars4 = Partnership.where('partnership = ? AND citizen = ? AND user_id = ?  AND rdate BETWEEN ? AND ?', 'With family', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:nump)
        

        $pars5 = Partnership.where('partnership = ? AND citizen = ? AND user_id = ?  AND rdate BETWEEN ? AND ?', 'With children', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:nump)
        

        $pars6 = Partnership.where('partnership = ? AND citizen = ? AND user_id = ?  AND rdate BETWEEN ? AND ?', 'Packaged tour', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:nump)
       


       


        $pars7 = Partnership.where('partnership = ? AND citizen = ? AND user_id = ?  AND rdate BETWEEN ? AND ?', 'School tour', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:nump)
       

       

        
        $pars8 = Partnership.where('partnership = ? AND citizen = ? AND user_id = ?  AND rdate BETWEEN ? AND ?', 'Other', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:nump)
        
      
      
         @chart630 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Travel partnership")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Alone", :yAxis => 0, :data => [$pars])
	  f.series(:name => "With spouse/partner", :yAxis => 0, :data => [$pars1])
          f.series(:name => "With colleagues", :yAxis => 0, :data => [$pars2])
          f.series(:name => "With friends & relatives", :yAxis => 0, :data => [$pars3])



          f.series(:name => "With family", :yAxis => 0, :data => [$pars4])
          f.series(:name => "With children", :yAxis => 0, :data => [$pars5])
          f.series(:name => "Packaged tour", :yAxis => 0, :data => [$pars6])
          f.series(:name => "School tour", :yAxis => 0, :data => [$pars7])
          f.series(:name => "Other", :yAxis => 0, :data => [$pars8])


	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



       $yy = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:male)
    $zz = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Nonswazi', params[:search], params[:start_date], params[:end_date]).sum(:female)

    


    @chart15 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Gender")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Male visitors", :yAxis => 0, :data => [$yy])
          f.series(:name => "Female visitors", :yAxis => 0, :data => [$zz])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



     @c = Country.where('name != ? AND user_id = ?  AND datev BETWEEN ? AND ?', "Swaziland", params[:search], params[:start_date], params[:end_date]).order('name')



    # @c = Country.where({datev: (params[:start_date]).. (params[:end_date])}).order('name')
   

   $x = InternationalVisitorInfor.where('user_id = ? AND rdate BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:africa)
   $x1 = InternationalVisitorInfor.where('user_id = ? AND rdate BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:america)
   $x2 = InternationalVisitorInfor.where('user_id = ? AND rdate BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:asia)
   $x3 = InternationalVisitorInfor.where('user_id = ? AND rdate BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:europe)

   

    @chart12 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Arrival by continent")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Africa", :yAxis => 0, :data => [$x])
          f.series(:name => "America", :yAxis => 0, :data => [$x1])
          f.series(:name => "Asia", :yAxis => 0, :data => [$x2])
          f.series(:name => "Europe", :yAxis => 0, :data => [$x3])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

    @i = Country.all
    respond_to do |format|
      format.html
      format.csv { send_data @i.to_csv, filename: "countries-#{Date.today}.csv"}
      
    end


    

    end



    

  end

  def show
    respond_with(@international_visitor_infor)
  end

  def new
    @international_visitor_infor = InternationalVisitorInfor.new
    respond_with(@international_visitor_infor)
  end

  def edit
  end

  def create
    @international_visitor_infor = InternationalVisitorInfor.new(international_visitor_infor_params)
    @international_visitor_infor.save
    respond_with(@international_visitor_infor)
  end

  def update
    @international_visitor_infor.update(international_visitor_infor_params)
    respond_with(@international_visitor_infor)
  end

  def destroy
    @international_visitor_infor.destroy
    respond_with(@international_visitor_infor)
  end

  private
    def set_international_visitor_infor
      @international_visitor_infor = InternationalVisitorInfor.find(params[:id])
    end

    def international_visitor_infor_params
      params.require(:international_visitor_infor).permit(:africa, :asia, :america, :europe, :visitor_info_id)
    end
end
