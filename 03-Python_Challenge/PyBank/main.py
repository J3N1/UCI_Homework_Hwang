# Modules
import os
import csv

# Path to collect data from the Resources folder
budget_csv = os.path.join('Resources', 'budget_data.csv')

# Read in the CSV file
with open(budget_csv, 'r') as csvfile:
    
    # Split the data on commas
    csvreader = csv.reader(csvfile, delimiter=',')

    csv_header = next(csvreader)

    # Define variables 
    months = []
    profit_loss_changes = []
    
    count_months = 0
    current_total = 0
    previous_total = 0
    net_total = 0
    change = 0

    # Loop through the data 
    for row in csvreader:
        # To calculate total number of months
        count_months += 1

        # To calculate total profit/loss
        current_total = int(row[1])
        net_total += current_total

        # To calculate average of the changes in profit/loss
        if (count_months == 1): 
            previous_total = current_total
            continue
        else:
            # Calculate change in profit loss
            change = current_total - previous_total

            # Append each month to the list months []
            months.append(row[0])

            # Append each change to the list profit_loss_changes []
            profit_loss_changes.append(change)

            # Set up previous_total = current_total for next loop 
            previous_total = current_total

    # Calculate the total and average of the changes for profit/loss
    sum_profit_loss = sum(profit_loss_changes)
    average = round(sum_profit_loss/(count_months-1),2)

    # Find greatest increase and decrease in profit/loss
    increase = max(profit_loss_changes)
    decrease = min(profit_loss_changes)

    # Find the index of the greatest increase and decrease in profit/loss
    increase_index = profit_loss_changes.index(increase)
    decrease_index = profit_loss_changes.index(decrease)

    # Assign best and worst month
    best_month = months[increase_index]
    worst_month = months[decrease_index]
            
# Print results to gitbash
print("Financial Analysis")
print("---------------------------------")
print(f"Total Months: {count_months}")
print(f"Total: ${net_total}")
print(f"Average Change: ${average}")
print(f"Greatest Increase in Profits: {best_month} $({increase})")
print(f"Greatest Decrease in Profits: {worst_month} $({decrease})")

# Path to export results to the Analysis folder
budget_csv = os.path.join('Analysis', 'budget_data.txt')
with open(budget_csv, 'w') as outfile:

    outfile.write("Financial Analysis\n")
    outfile.write("---------------------------------\n")
    outfile.write(f"Total Months: {count_months}\n")
    outfile.write(f"Total: ${net_total}\n")
    outfile.write(f"Average Change: ${average}\n")
    outfile.write(f"Greatest Increase in Profits: {best_month} $({increase})\n")
    outfile.write(f"Greatest Decrease in Profits: {worst_month} $({decrease})\n")
