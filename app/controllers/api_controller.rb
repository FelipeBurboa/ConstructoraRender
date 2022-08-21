class ApiController < ApplicationController
    def news
        @constructionsApi = Construction.all.order(created_at: :desc).limit(20)
        @constructionsApi = jsoned_constructions @constructionsApi
        render json: @constructionsApi
    end

    def between_dates
        @constructionsApi = Construction.where(created_at: date1..date2)
        @constructionsApi = jsoned_constructions @constructionsApi
        render json: @constructionsApi
    end

    private

    def date1
        params[:date1]&.to_date&.beginning_of_day
    end

    def date2
        params[:date2]&.to_date&.end_of_day
    end

    def jsoned_constructions(constructions)
        unless date1.nil? && date2.nil?
            return {message: "Ponga fechas validas"} if date1 > date2
        end

        constructions.map do |c|
            {
                id: c.id,
                name: c.name,
                cost: c.cost,
                street: c.street,
                number: c.number,
                city: c.city, 
                state: c.state,
                postcode: c.postcode
            }
        end
    end
end


