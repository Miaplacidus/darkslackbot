require './config/config'

class Forecast
    attr_accessor :time, :forecast

    # default location is NYC
    def initialize(time, latitude=40.7127, longitude=-74.0059)
        @time = time
        @forecast = ForecastIO.forecast(latitude, longitude, time: time.to_i)
    end

    def weather_forecast
        current_weather = forecast.currently

        summary = current_weather.summary
        temperature = current_weather.temperature

        weather_msg(time, summary, temperature, forecast.minutely, forecast.alerts)
    end

    def moon_phase
        phase = forecast.daily.data.first.moonPhase

        case
        when phase == 0 then "New Moon :new_moon_with_face:"
        when phase > 0 && phase < 0.25 then "Waxing Crescent Moon :waxing_crescent_moon:"
        when phase == 0.25 then "First Quarter Moon :first_quarter_moon:"
        when phase > 0.25 && phase < 0.5 then "Waxing Gibbous Moon :waxing_gibbous_moon:"
        when phase == 0.5 then "Full Moon :full_moon_with_face:"
        when phase > 0.5 && phase < 0.75 then "Waning Gibbous Moon :waning_gibbous_moon:"
        when phase == 0.75 then "Last Quarter Moon :last_quarter_moon:"
        when phase > 0.75 then "Waning Crescent Moon :waning_crescent_moon:"
        end
    end

    private

    def weather_msg(time, summary, temperature, imminent_weather, alerts)
        <<~MSG
            Forecast for #{time.strftime('%l:%M %P on %A %B %-d, %Y')}:
            #{summary.downcase} with a temperature of #{temperature}° F

            #{imminent_weather_msg(imminent_weather)}

            Alerts:
            #{alert_msg(alerts)}
        MSG
    end

    def imminent_weather_msg(imminent_weather)
        unless imminent_weather.nil?
            <<~MSG
                Soon:
                "#{imminent_weather.summary}"
            MSG
        else
            ""
        end
    end

    def alert_msg(alerts)
        unless alerts.nil?
            "#{alerts.title} - #{alerts.description}"
        else
            "None"
        end
    end
end
