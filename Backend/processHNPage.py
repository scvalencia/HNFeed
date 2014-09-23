# -*- coding: utf-8 -*-

import bs4
import json
import requests

DEBUGGING = False
FAST_DEBUGGING = False
PRODUCTION = False
TESTING = True

page = 'https://news.ycombinator.com/'

def getHTML(pageOfURL):
	requestObject = requests.get(pageOfURL)
	sourceCode = requestObject.text
	bsObject = bs4.BeautifulSoup(sourceCode)
	# prettyCode = bsObject.prettify()
	mainTable = bsObject.find("table")
	itemTable = mainTable.findAll("tr")[3]

	items = itemTable.findAll("td")[1:-2]

	n = 1
	ifHiring = None

	objects = {}
	associations = ["number", "linkToVote", "voteIdUp", "voteIdDown",
					"title", "source", "link", "points", "user",
					"linkToUser", "time", "comments", "linkToComments"]
	single_object = []
	news = []
	
	for item in items:
		if n == 4:
			n += 1
			continue

		element = item.get_text()

		number = ''
		linkToVote = ''
		voteIdUp = ''
		voteIdDown = ''
		title = ''
		source = ''
		link = ''
		points = ''
		user = ''
		linkToUser = ''
		time = ''
		comments = ''
		linkToComments = ''
		

		if n == 1: 
			number = str(element[:-1])			
			if DEBUGGING:
				print '*' * 33
				print number
			else:
				single_object.append(number)
		elif n == 2:
			aTag = item.a
			spanTag = item.span
			if aTag == None and spanTag == None:
				ifHiring = item 
			else:
				linkToVote = str(aTag['href'])
				voteIdUp = str(aTag['id'])
				voteIdDown = str(spanTag['id'])
			if DEBUGGING:
				print linkToVote 
				print voteIdUp 
				print voteIdDown			
			else:
				single_object.append(linkToVote)
				single_object.append(voteIdUp)
				single_object.append(voteIdDown)
		elif n == 3:
			title = str((item.contents[0].contents[0]).encode('ascii','ignore'))
			if ifHiring != None:				
				link = page + str(item.a['href'])			
			
			else:
				if item.span != None:
					source = str(item.span.contents[0]).strip()
					link = str(item.a['href'])
			#ifHiring = None
			if DEBUGGING:
				print title 
				print source 
				print link
			else:
				single_object.append(title)
				single_object.append(source)
				single_object.append(link)

		elif n == 5:
			spanTag = item.span
			aTag = item.findAll('a')
			if len(aTag) == 0:
				time = str(item.contents[0])
			else:
				points = str(spanTag.contents[0])
				userInfo = aTag[0]
				user = str(userInfo.contents[0])
				linkToUser = page + str(userInfo['href'])
				
				time = str(item.contents[3]).replace('|', '').strip()
				comments = str(aTag[1].contents[0])
				linkToComments = page + str(aTag[1]['href'])

			#points = spanTag.contents
			if DEBUGGING:
				print points
				print user 
				print linkToUser 
				print time 
				print comments
				print linkToComments
			else:
				single_object.append(points)
				single_object.append(user)
				single_object.append(linkToUser)
				single_object.append(time)
				single_object.append(comments)
				single_object.append(linkToComments)
			n = 1			
			ifHiring = None
			new = {}
			for i in range(len(associations)):
				key = associations[i]
				value = single_object[i]
				if DEBUGGING:
					break
				elif FAST_DEBUGGING:
					print key, ' : ', value
				elif PRODUCTION or TESTING:
					new[key] = value
			news.append(new)
			single_object = []
			continue

		n += 1

		with open('data.json', 'w') as outfile:
  			json.dump(news, outfile)

		#json.dumps(news, ensure_ascii = False)

getHTML(page)