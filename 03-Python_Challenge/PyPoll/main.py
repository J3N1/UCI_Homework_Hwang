# Modules
import os
import csv

# Path to collect data from the Resources folder
budget_csv = os.path.join('Resources', 'election_data.csv')

# Read in the CSV file
with open(budget_csv, 'r') as csvfile:
    
    # Split the data on commas
    csvreader = csv.reader(csvfile, delimiter=',')

    csv_header = next(csvreader)

    # Define variables 
    totalcandidates = []
    votes_per_candidate = []
    percentages = []

    votesnumber = 0
    max_index = 0

    # Loop through the data 
    for row in csvreader:
        votesnumber = votesnumber + 1

        candidate = row[2]

        # Add votes to total candidates
        if candidate in totalcandidates:
            candidate_index = totalcandidates.index(candidate)
            votes_per_candidate[candidate_index] = votes_per_candidate[candidate_index] + 1
        else:
            totalcandidates.append(candidate)
            votes_per_candidate.append(1)
    
    maxvotes = votes_per_candidate[0]
    #Calculate max votes per candidate for each candidate 
    for count in range(len(totalcandidates)):
        vote_percentage = (votes_per_candidate[count]/votesnumber)*100
        percentages.append(vote_percentage)
        if votes_per_candidate[count] > maxvotes:
            maxvotes = votes_per_candidate[count]
            print(maxvotes)
            max_index = count
    
    #Calculate winner of candidates 
    winner = totalcandidates[max_index]

    #Calculate percentage of candidates 
    percentages = [round(i,2) for i in percentages]

#Print results to gitbash
print("Election Results")
print("------------------------------")
print(f"Total Votes: {votesnumber}")
print("------------------------------")
for count in range(len(totalcandidates)):
    print(f"{totalcandidates[count]}: {percentages[count]}% ({votes_per_candidate[count]})")
print("------------------------------")
print(f" Winner : {winner}")
print("------------------------------")

# Path to export results to the Analysis folder
budget_csv = os.path.join('Analysis', 'election_data.txt')
with open(budget_csv, 'w') as outfile:

    outfile.write("Election Results\n")
    outfile.write("------------------------------\n")
    outfile.write(f"Total Votes: {votesnumber}\n")
    outfile.write("------------------------------\n")
    for count in range(len(totalcandidates)):
        outfile.write(f"{totalcandidates[count]}: {percentages[count]}% ({votes_per_candidate[count]})\n")
    outfile.write("------------------------------\n")
    outfile.write(f" Winner : {winner}\n")
    outfile.write("------------------------------\n") 