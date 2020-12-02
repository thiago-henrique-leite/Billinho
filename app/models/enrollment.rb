class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :student

  has_many :bills

  # Performs the necessary validations
  validates :total_value, numericality: { greater_than: 0, message: 'Invalid or not informed total value.' }
  validates :amount_bills, numericality: { greater_than: 0, message: 'Invalid or unreported bills quantity.' }
  validates :due_day, numericality: { greater_than: 0, less_than: 32, message: 'Invalid or uninformed day.' }
  validates :course, presence: { message: 'Course not informed.' }

  after_create :create_bills

  def create_bills
    # Get the current date
    @date = Time.now

    @day = @date.strftime('%d').to_i
    @mounth = @date.strftime('%m').to_i
    @year = @date.strftime('%Y').to_i

    # Checks whether the charge will start in the current or next month
    @mounth += 1 if due_day <= @day

    @day = due_day

    # Returns the number of days in the month
    def max(mounth)
      if mounth == 2
        28
      elsif mounth == 4 || mounth == 6 || mounth == 9 || mounth == 11
        30
      else
        31
      end
    end

    # Calculates the value of each bill
    @value = total_value / amount_bills
    @value = @value.round(2)

    amount_bills.times do |_index|
      @signal = 0

      # Checks if the year is over
      if @mounth > 12
        @year += 1
        @mounth = 1
      end

      # If the due date is greater than 28, different treatment is required for each month
      # In months that do not have the due date, the invoice moves to the 1st of the next month
      if @day > 28
        @max_days_mounth = max(@mounth)
        if @day > @max_days_mounth
          @day = 1
          @mounth += 1
          @signal = 1 # This variable signal that the month has already been increased, so it will not be increased later
        end
      end

      # Places the zeros to the left of numbers less than 10
      @day = format('%.2d', @day)
      @mounth = format('%.2d', @mounth)

      # Create a bill
      Bill.create({
                    bill_value: @value.to_s,
                    due_date: "#{@year}-#{@mounth}-#{@day}",
                    enrollment_id: id,
                    student_id: student_id,
                    institution_id: institution_id,
                    status: 'open'
                  })

      @day = @day.to_i
      @mounth = @mounth.to_i

      # Update mounth
      if @signal == 0
        @mounth += 1
      else
        @day = due_day
      end
    end
  end
end
