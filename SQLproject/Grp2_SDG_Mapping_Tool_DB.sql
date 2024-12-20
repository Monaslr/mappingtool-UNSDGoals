DROP DATABASE IF EXISTS mappingtool; -- testing purposes...comment out / delete when done

CREATE DATABASE mappingtool;
USE mappingtool;

CREATE TABLE roles(
role_id INT PRIMARY KEY AUTO_INCREMENT,
role_name VARCHAR(50)
);

CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(255) NOT NULL,
user_email VARCHAR(255) NOT NULL,
role_id INT NOT NULL,
FOREIGN KEY (role_id) REFERENCES roles(role_id)
);


CREATE TABLE projects (
project_id INT PRIMARY KEY AUTO_INCREMENT,
project_name VARCHAR(500),
project_desc VARCHAR(1500),
user_id INT,
tag VARCHAR(50),
project_time_created DATE,
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE goals(
goal_id INT PRIMARY KEY AUTO_INCREMENT,
goal_name VARCHAR(500),
goal_desc VARCHAR(1500),
goal_image_url VARCHAR(255)
);

CREATE TABLE targets(
target_id INT PRIMARY KEY AUTO_INCREMENT,
target_name VARCHAR(10),
target_desc VARCHAR(2000),
goal_id INT,
FOREIGN KEY (goal_id) REFERENCES goals(goal_id)
);

CREATE TABLE projects_targets(
project_target_id INT PRIMARY KEY AUTO_INCREMENT,
project_id INT,
target_id INT,
FOREIGN KEY (project_id) REFERENCES projects(project_id),
FOREIGN KEY (target_id) REFERENCES targets(target_id)
);

CREATE TABLE indicators(
indicator_id INT PRIMARY KEY AUTO_INCREMENT,
indicator_name VARCHAR(10),
indicator_desc VARCHAR(2000),
target_id INT,
FOREIGN KEY (target_id) REFERENCES targets(target_id)
);

CREATE TABLE projects_indicators(
project_indicator_id INT PRIMARY KEY AUTO_INCREMENT,
project_id INT,
indicator_id INT,
FOREIGN KEY (project_id) REFERENCES projects(project_id),
FOREIGN KEY (indicator_id) REFERENCES indicators(indicator_id)
);

CREATE TABLE auth_users(
auth_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT UNIQUE,
pwd_hash VARCHAR(255),
token VARCHAR(255),
token_time_created DATETIME,
token_time_expires DATETIME
);

-- insert information to goals table
INSERT INTO goals(goal_name, goal_desc)VALUES ("No Poverty", "End poverty in all its forms everywhere");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Zero Hunger", "End hunger, achieve food security and improved nutrition and promote sustainable agriculture");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Good Health And Well-Being", "Ensure healthy lives and promote well-being for all at all ages");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Quality Education", "Ensure inclusive and equitable quality education and promote lifelong learning opportunities for all");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Gender Equality", "Achieve gender equality and empower all women and girls");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Clean Water And Sanitation", "Ensure availability and sustainable management of water and sanitation for all");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Affordable And Clean Energy", "Ensure access to affordable, reliable, sustainable and modern energy for all");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Decent Work And Economic Growth", "Promote sustained, inclusive and sustainable economic growth, full and productive employment and decent work for all");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Industry, Innovation And Infrastructure", "Build resilient infrastructure, promote inclusive and sustainable industrialization and foster innovation");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Reduced Inequalities", "Reduce inequality within and among countries");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Sustainable Cities And Communities", "Make cities and human settlements inclusive, safe, resilient and sustainable");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Responsible Consumption And Production", "Ensure sustainable consumption and production patterns");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Climate Action", "Take urgent action to combat climate change and its impacts");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Life Below Water", "Conserve and sustainably use the oceans, seas and marine resources for sustainable development");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Life On Land", "Protect, restore and promote sustainable use of terrestrial ecosystems, sustainably manage forests, combat desertification, and halt and reverse land degradation and halt biodiversity loss");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Peace, Justice And Strong Institutions", "Promote peaceful and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels");
INSERT INTO goals(goal_name, goal_desc)VALUES ("Partnership For The Goals", "Strengthen the means of implementation and revitalize the Global Partnership for Sustainable Development");

-- insert information to target table
INSERT INTO targets(target_name, target_desc) VALUES ("1.1","By 2030, eradicate extreme poverty for all people everywhere, currently measured as people living on less than $1.25 a day");
INSERT INTO targets(target_name, target_desc) VALUES ("1.2","By 2030, reduce at least by half the proportion of men, women and children of all ages living in poverty in all its dimensions according to national definitions");
INSERT INTO targets(target_name, target_desc) VALUES ("1.3","Implement nationally appropriate social protection systems and measures for all, including floors, and by 2030 achieve substantial coverage of the poor and the vulnerable");
INSERT INTO targets(target_name, target_desc) VALUES ("1.4","By 2030, ensure that all men and women, in particular the poor and the vulnerable, have equal rights to economic resources, as well as access to basic services, ownership and control over land and other forms of property, inheritance, natural resources, appropriate new technology and financial services, including microfinance");
INSERT INTO targets(target_name, target_desc) VALUES ("1.5","By 2030, build the resilience of the poor and those in vulnerable situations and reduce their exposure and vulnerability to climate-related extreme events and other economic, social and environmental shocks and disasters");
INSERT INTO targets(target_name, target_desc) VALUES ("1.a","Ensure significant mobilization of resources from a variety of sources, including through enhanced development cooperation, in order to provide adequate and predictable means for developing countries, in particular least developed countries, to implement programmes and policies to end poverty in all its dimensions");
INSERT INTO targets(target_name, target_desc) VALUES ("1.b","Create sound policy frameworks at the national, regional and international levels, based on pro-poor and gender-sensitive development strategies, to support accelerated investment in poverty eradication actions");
INSERT INTO targets(target_name, target_desc) VALUES ("2.1","By 2030, end hunger and ensure access by all people, in particular the poor and people in vulnerable situations, including infants, to safe, nutritious and sufficient food all year round");
INSERT INTO targets(target_name, target_desc) VALUES ("2.2","By 2030, end all forms of malnutrition, including achieving, by 2025, the internationally agreed targets on stunting and wasting in children under 5 years of age, and address the nutritional needs of adolescent girls, pregnant and lactating women and older persons");
INSERT INTO targets(target_name, target_desc) VALUES ("2.3","By 2030, double the agricultural productivity and incomes of small-scale food producers, in particular women, indigenous peoples, family farmers, pastoralists and fishers, including through secure and equal access to land, other productive resources and inputs, knowledge, financial services, markets and opportunities for value addition and non-farm employment");
INSERT INTO targets(target_name, target_desc) VALUES ("2.4","By 2030, ensure sustainable food production systems and implement resilient agricultural practices that increase productivity and production, that help maintain ecosystems, that strengthen capacity for adaptation to climate change, extreme weather, drought, flooding and other disasters and that progressively improve land and soil quality");
INSERT INTO targets(target_name, target_desc) VALUES ("2.5","By 2020, maintain the genetic diversity of seeds, cultivated plants and farmed and domesticated animals and their related wild species, including through soundly managed and diversified seed and plant banks at the national, regional and international levels, and promote access to and fair and equitable sharing of benefits arising from the utilization of genetic resources and associated traditional knowledge, as internationally agreed");
INSERT INTO targets(target_name, target_desc) VALUES ("2.a","Increase investment, including through enhanced international cooperation, in rural infrastructure, agricultural research and extension services, technology development and plant and livestock gene banks in order to enhance agricultural productive capacity in developing countries, in particular least developed countries");
INSERT INTO targets(target_name, target_desc) VALUES ("2.b","Correct and prevent trade restrictions and distortions in world agricultural markets, including through the parallel elimination of all forms of agricultural export subsidies and all export measures with equivalent effect, in accordance with the mandate of the Doha Development Round");
INSERT INTO targets(target_name, target_desc) VALUES ("2.c","Adopt measures to ensure the proper functioning of food commodity markets and their derivatives and facilitate timely access to market information, including on food reserves, in order to help limit extreme food price volatility");
INSERT INTO targets(target_name, target_desc) VALUES ("3.1","By 2030, reduce the global maternal mortality ratio to less than 70 per 100,000 live births");
INSERT INTO targets(target_name, target_desc) VALUES ("3.2","By 2030, end preventable deaths of newborns and children under 5 years of age, with all countries aiming to reduce neonatal mortality to at least as low as 12 per 1,000 live births and under-5 mortality to at least as low as 25 per 1,000 live births");
INSERT INTO targets(target_name, target_desc) VALUES ("3.3","By 2030, end the epidemics of AIDS, tuberculosis, malaria and neglected tropical diseases and combat hepatitis, water-borne diseases and other communicable diseases");
INSERT INTO targets(target_name, target_desc) VALUES ("3.4","By 2030, reduce by one third premature mortality from non-communicable diseases through prevention and treatment and promote mental health and well-being");
INSERT INTO targets(target_name, target_desc) VALUES ("3.5","Strengthen the prevention and treatment of substance abuse, including narcotic drug abuse and harmful use of alcohol");
INSERT INTO targets(target_name, target_desc) VALUES ("3.6","By 2020, halve the number of global deaths and injuries from road traffic accidents");
INSERT INTO targets(target_name, target_desc) VALUES ("3.7","By 2030, ensure universal access to sexual and reproductive health-care services, including for family planning, information and education, and the integration of reproductive health into national strategies and programmes");
INSERT INTO targets(target_name, target_desc) VALUES ("3.8","Achieve universal health coverage, including financial risk protection, access to quality essential health-care services and access to safe, effective, quality and affordable essential medicines and vaccines for all");
INSERT INTO targets(target_name, target_desc) VALUES ("3.9","By 2030, substantially reduce the number of deaths and illnesses from hazardous chemicals and air, water and soil pollution and contamination");
INSERT INTO targets(target_name, target_desc) VALUES ("3.a","Strengthen the implementation of the World Health Organization Framework Convention on Tobacco Control in all countries, as appropriate");
INSERT INTO targets(target_name, target_desc) VALUES ("3.b","Support the research and development of vaccines and medicines for the communicable and non-communicable diseases that primarily affect developing countries, provide access to affordable essential medicines and vaccines, in accordance with the Doha Declaration on the TRIPS Agreement and Public Health, which affirms the right of developing countries to use to the full the provisions in the Agreement on Trade-Related Aspects of Intellectual Property Rights regarding flexibilities to protect public health, and, in particular, provide access to medicines for all");
INSERT INTO targets(target_name, target_desc) VALUES ("3.c","Substantially increase health financing and the recruitment, development, training and retention of the health workforce in developing countries, especially in least developed countries and small island developing States");
INSERT INTO targets(target_name, target_desc) VALUES ("3.d","Strengthen the capacity of all countries, in particular developing countries, for early warning, risk reduction and management of national and global health risks");
INSERT INTO targets(target_name, target_desc) VALUES ("4.1","By 2030, ensure that all girls and boys complete free, equitable and quality primary and secondary education leading to relevant and effective learning outcomes");
INSERT INTO targets(target_name, target_desc) VALUES ("4.2","By 2030, ensure that all girls and boys have access to quality early childhood development, care and pre-primary education so that they are ready for primary education");
INSERT INTO targets(target_name, target_desc) VALUES ("4.3","By 2030, ensure that all girls and boys have access to quality early childhood development, care and pre-primary education so that they are ready for primary education");
INSERT INTO targets(target_name, target_desc) VALUES ("4.4","By 2030, substantially increase the number of youth and adults who have relevant skills, including technical and vocational skills, for employment, decent jobs and entrepreneurship");
INSERT INTO targets(target_name, target_desc) VALUES ("4.5","By 2030, eliminate gender disparities in education and ensure equal access to all levels of education and vocational training for the vulnerable, including persons with disabilities, indigenous peoples and children in vulnerable situations");
INSERT INTO targets(target_name, target_desc) VALUES ("4.6","By 2030, ensure that all youth and a substantial proportion of adults, both men and women, achieve literacy and numeracy");
INSERT INTO targets(target_name, target_desc) VALUES ("4.7","By 2030, ensure that all learners acquire the knowledge and skills needed to promote sustainable development, including, among others, through education for sustainable development and sustainable lifestyles, human rights, gender equality, promotion of a culture of peace and non-violence, global citizenship and appreciation of cultural diversity and of culture’s contribution to sustainable development");
INSERT INTO targets(target_name, target_desc) VALUES ("4.a","Build and upgrade education facilities that are child, disability and gender sensitive and provide safe, non-violent, inclusive and effective learning environments for all");
INSERT INTO targets(target_name, target_desc) VALUES ("4.b","By 2020, substantially expand globally the number of scholarships available to developing countries, in particular least developed countries, small island developing States and African countries, for enrolment in higher education, including vocational training and information and communications technology, technical, engineering and scientific programmes, in developed countries and other developing countries");
INSERT INTO targets(target_name, target_desc) VALUES ("4.c","By 2030, substantially increase the supply of qualified teachers, including through international cooperation for teacher training in developing countries, especially least developed countries and small island developing States");
INSERT INTO targets(target_name, target_desc) VALUES ("5.1","End all forms of discrimination against all women and girls everywhere");
INSERT INTO targets(target_name, target_desc) VALUES ("5.2","Eliminate all forms of violence against all women and girls in the public and private spheres, including trafficking and sexual and other types of exploitation");
INSERT INTO targets(target_name, target_desc) VALUES ("5.3","Eliminate all harmful practices, such as child, early and forced marriage and female genital mutilation");
INSERT INTO targets(target_name, target_desc) VALUES ("5.4","Recognize and value unpaid care and domestic work through the provision of public services, infrastructure and social protection policies and the promotion of shared responsibility within the household and the family as nationally appropriate");
INSERT INTO targets(target_name, target_desc) VALUES ("5.5","Ensure women’s full and effective participation and equal opportunities for leadership at all levels of decision-making in political, economic and public life");
INSERT INTO targets(target_name, target_desc) VALUES ("5.6","Ensure universal access to sexual and reproductive health and reproductive rights as agreed in accordance with the Programme of Action of the International Conference on Population and Development and the Beijing Platform for Action and the outcome documents of their review conferences");
INSERT INTO targets(target_name, target_desc) VALUES ("5.a","Undertake reforms to give women equal rights to economic resources, as well as access to ownership and control over land and other forms of property, financial services, inheritance and natural resources, in accordance with national laws");
INSERT INTO targets(target_name, target_desc) VALUES ("5.b","Enhance the use of enabling technology, in particular information and communications technology, to promote the empowerment of women");
INSERT INTO targets(target_name, target_desc) VALUES ("5.c","Adopt and strengthen sound policies and enforceable legislation for the promotion of gender equality and the empowerment of all women and girls at all levels");
INSERT INTO targets(target_name, target_desc) VALUES ("6.1","By 2030, achieve universal and equitable access to safe and affordable drinking water for all");
INSERT INTO targets(target_name, target_desc) VALUES ("6.2","By 2030, achieve access to adequate and equitable sanitation and hygiene for all and end open defecation, paying special attention to the needs of women and girls and those in vulnerable situations");
INSERT INTO targets(target_name, target_desc) VALUES ("6.3","By 2030, improve water quality by reducing pollution, eliminating dumping and minimizing release of hazardous chemicals and materials, halving the proportion of untreated wastewater and substantially increasing recycling and safe reuse globally");
INSERT INTO targets(target_name, target_desc) VALUES ("6.4","By 2030, substantially increase water-use efficiency across all sectors and ensure sustainable withdrawals and supply of freshwater to address water scarcity and substantially reduce the number of people suffering from water scarcity");
INSERT INTO targets(target_name, target_desc) VALUES ("6.5","By 2030, implement integrated water resources management at all levels, including through transboundary cooperation as appropriate");
INSERT INTO targets(target_name, target_desc) VALUES ("6.6","By 2020, protect and restore water-related ecosystems, including mountains, forests, wetlands, rivers, aquifers and lakes");
INSERT INTO targets(target_name, target_desc) VALUES ("6.a","By 2030, expand international cooperation and capacity-building support to developing countries in water- and sanitation-related activities and programmes, including water harvesting, desalination, water efficiency, wastewater treatment, recycling and reuse technologies");
INSERT INTO targets(target_name, target_desc) VALUES ("6.b","Support and strengthen the participation of local communities in improving water and sanitation management");
INSERT INTO targets(target_name, target_desc) VALUES ("7.1","By 2030, ensure universal access to affordable, reliable and modern energy services");
INSERT INTO targets(target_name, target_desc) VALUES ("7.2","By 2030, increase substantially the share of renewable energy in the global energy mix");
INSERT INTO targets(target_name, target_desc) VALUES ("7.3","By 2030, double the global rate of improvement in energy efficiency");
INSERT INTO targets(target_name, target_desc) VALUES ("7.a","By 2030, enhance international cooperation to facilitate access to clean energy research and technology, including renewable energy, energy efficiency and advanced and cleaner fossil-fuel technology, and promote investment in energy infrastructure and clean energy technology");
INSERT INTO targets(target_name, target_desc) VALUES ("7.b","By 2030, expand infrastructure and upgrade technology for supplying modern and sustainable energy services for all in developing countries, in particular least developed countries, small island developing States, and land-locked developing countries, in accordance with their respective programmes of support");
INSERT INTO targets(target_name, target_desc) VALUES ("8.1","Sustain per capita economic growth in accordance with national circumstances and, in particular, at least 7 per cent gross domestic product growth per annum in the least developed countries");
INSERT INTO targets(target_name, target_desc) VALUES ("8.2","Achieve higher levels of economic productivity through diversification, technological upgrading and innovation, including through a focus on high-value added and labour-intensive sectors");
INSERT INTO targets(target_name, target_desc) VALUES ("8.3","Promote development-oriented policies that support productive activities, decent job creation, entrepreneurship, creativity and innovation, and encourage the formalization and growth of micro-, small- and medium-sized enterprises, including through access to financial services");
INSERT INTO targets(target_name, target_desc) VALUES ("8.4","Improve progressively, through 2030, global resource efficiency in consumption and production and endeavour to decouple economic growth from environmental degradation, in accordance with the 10-Year Framework of Programmes on Sustainable Consumption and Production, with developed countries taking the lead");
INSERT INTO targets(target_name, target_desc) VALUES ("8.5","By 2030, achieve full and productive employment and decent work for all women and men, including for young people and persons with disabilities, and equal pay for work of equal value");
INSERT INTO targets(target_name, target_desc) VALUES ("8.6","By 2020, substantially reduce the proportion of youth not in employment, education or training");
INSERT INTO targets(target_name, target_desc) VALUES ("8.7","Take immediate and effective measures to eradicate forced labour, end modern slavery and human trafficking and secure the prohibition and elimination of the worst forms of child labour, including recruitment and use of child soldiers, and by 2025 end child labour in all its forms");
INSERT INTO targets(target_name, target_desc) VALUES ("8.8","Protect labour rights and promote safe and secure working environments for all workers, including migrant workers, in particular women migrants, and those in precarious employment");
INSERT INTO targets(target_name, target_desc) VALUES ("8.9","By 2030, devise and implement policies to promote sustainable tourism that creates jobs and promotes local culture and products");
INSERT INTO targets(target_name, target_desc) VALUES ("8.10","Strengthen the capacity of domestic financial institutions to encourage and expand access to banking, insurance and financial services for all");
INSERT INTO targets(target_name, target_desc) VALUES ("8.a","Increase Aid for Trade support for developing countries, in particular least developed countries, including through the Enhanced Integrated Framework for Trade-Related Technical Assistance to Least Developed Countries");
INSERT INTO targets(target_name, target_desc) VALUES ("8.b","By 2020, develop and operationalize a global strategy for youth employment and implement the Global Jobs Pact of the International Labour Organization");
INSERT INTO targets(target_name, target_desc) VALUES ("9.1","Develop quality, reliable, sustainable and resilient infrastructure, including regional and transborder infrastructure, to support economic development and human well-being, with a focus on affordable and equitable access for all");
INSERT INTO targets(target_name, target_desc) VALUES ("9.2","Promote inclusive and sustainable industrialization and, by 2030, significantly raise industry’s share of employment and gross domestic product, in line with national circumstances, and double its share in least developed countries");
INSERT INTO targets(target_name, target_desc) VALUES ("9.3","Increase the access of small-scale industrial and other enterprises, in particular in developing countries, to financial services, including affordable credit, and their integration into value chains and markets");
INSERT INTO targets(target_name, target_desc) VALUES ("9.4","By 2030, upgrade infrastructure and retrofit industries to make them sustainable, with increased resource-use efficiency and greater adoption of clean and environmentally sound technologies and industrial processes, with all countries taking action in accordance with their respective capabilities");
INSERT INTO targets(target_name, target_desc) VALUES ("9.5","Enhance scientific research, upgrade the technological capabilities of industrial sectors in all countries, in particular developing countries, including, by 2030, encouraging innovation and substantially increasing the number of research and development workers per 1 million people and public and private research and development spending");
INSERT INTO targets(target_name, target_desc) VALUES ("9.a","Facilitate sustainable and resilient infrastructure development in developing countries through enhanced financial, technological and technical support to African countries, least developed countries, landlocked developing countries and small island developing States");
INSERT INTO targets(target_name, target_desc) VALUES ("9.b","Support domestic technology development, research and innovation in developing countries, including by ensuring a conducive policy environment for, inter alia, industrial diversification and value addition to commodities");
INSERT INTO targets(target_name, target_desc) VALUES ("9.c","Significantly increase access to information and communications technology and strive to provide universal and affordable access to the Internet in least developed countries by 2020");
INSERT INTO targets(target_name, target_desc) VALUES ("10.1","By 2030, progressively achieve and sustain income growth of the bottom 40 per cent of the population at a rate higher than the national average");
INSERT INTO targets(target_name, target_desc) VALUES ("10.2","By 2030, empower and promote the social, economic and political inclusion of all, irrespective of age, sex, disability, race, ethnicity, origin, religion or economic or other status");
INSERT INTO targets(target_name, target_desc) VALUES ("10.3","Ensure equal opportunity and reduce inequalities of outcome, including by eliminating discriminatory laws, policies and practices and promoting appropriate legislation, policies and action in this regard");
INSERT INTO targets(target_name, target_desc) VALUES ("10.4","Adopt policies, especially fiscal, wage and social protection policies, and progressively achieve greater equality");
INSERT INTO targets(target_name, target_desc) VALUES ("10.5","Improve the regulation and monitoring of global financial markets and institutions and strengthen the implementation of such regulations");
INSERT INTO targets(target_name, target_desc) VALUES ("10.6","Ensure enhanced representation and voice for developing countries in decision-making in global international economic and financial institutions in order to deliver more effective, credible, accountable and legitimate institutions");
INSERT INTO targets(target_name, target_desc) VALUES ("10.7","Facilitate orderly, safe, regular and responsible migration and mobility of people, including through the implementation of planned and well-managed migration policies");
INSERT INTO targets(target_name, target_desc) VALUES ("10.a","Implement the principle of special and differential treatment for developing countries, in particular least developed countries, in accordance with World Trade Organization agreements");
INSERT INTO targets(target_name, target_desc) VALUES ("10.b","Encourage official development assistance and financial flows, including foreign direct investment, to States where the need is greatest, in particular least developed countries, African countries, small island developing States and landlocked developing countries, in accordance with their national plans and programmes");
INSERT INTO targets(target_name, target_desc) VALUES ("10.c","By 2030, reduce to less than 3 per cent the transaction costs of migrant remittances and eliminate remittance corridors with costs higher than 5 per cent");
INSERT INTO targets(target_name, target_desc) VALUES ("11.1","By 2030, ensure access for all to adequate, safe and affordable housing and basic services and upgrade slums");
INSERT INTO targets(target_name, target_desc) VALUES ("11.2","By 2030, provide access to safe, affordable, accessible and sustainable transport systems for all, improving road safety, notably by expanding public transport, with special attention to the needs of those in vulnerable situations, women, children, persons with disabilities and older persons");
INSERT INTO targets(target_name, target_desc) VALUES ("11.3","By 2030, enhance inclusive and sustainable urbanization and capacity for participatory, integrated and sustainable human settlement planning and management in all countries");
INSERT INTO targets(target_name, target_desc) VALUES ("11.4","Strengthen efforts to protect and safeguard the world’s cultural and natural heritage");
INSERT INTO targets(target_name, target_desc) VALUES ("11.5","By 2030, significantly reduce the number of deaths and the number of people affected and substantially decrease the direct economic losses relative to global gross domestic product caused by disasters, including water-related disasters, with a focus on protecting the poor and people in vulnerable situations");
INSERT INTO targets(target_name, target_desc) VALUES ("11.6","By 2030, reduce the adverse per capita environmental impact of cities, including by paying special attention to air quality and municipal and other waste management");
INSERT INTO targets(target_name, target_desc) VALUES ("11.7","By 2030, provide universal access to safe, inclusive and accessible, green and public spaces, in particular for women and children, older persons and persons with disabilities");
INSERT INTO targets(target_name, target_desc) VALUES ("11.a","Support positive economic, social and environmental links between urban, peri-urban and rural areas by strengthening national and regional development planning");
INSERT INTO targets(target_name, target_desc) VALUES ("11.b","By 2020, substantially increase the number of cities and human settlements adopting and implementing integrated policies and plans towards inclusion, resource efficiency, mitigation and adaptation to climate change, resilience to disasters, and develop and implement, in line with the Sendai Framework for Disaster Risk Reduction 2015-2030, holistic disaster risk management at all levels");
INSERT INTO targets(target_name, target_desc) VALUES ("11.c","Support least developed countries, including through financial and technical assistance, in building sustainable and resilient buildings utilizing local materials");
INSERT INTO targets(target_name, target_desc) VALUES ("12.1","Implement the 10-Year Framework of Programmes on Sustainable Consumption and Production Patterns, all countries taking action, with developed countries taking the lead, taking into account the development and capabilities of developing countries");
INSERT INTO targets(target_name, target_desc) VALUES ("12.2","By 2030, achieve the sustainable management and efficient use of natural resources");
INSERT INTO targets(target_name, target_desc) VALUES ("12.3","By 2030, halve per capita global food waste at the retail and consumer levels and reduce food losses along production and supply chains, including post-harvest losses");
INSERT INTO targets(target_name, target_desc) VALUES ("12.4","By 2020, achieve the environmentally sound management of chemicals and all wastes throughout their life cycle, in accordance with agreed international frameworks, and significantly reduce their release to air, water and soil in order to minimize their adverse impacts on human health and the environment");
INSERT INTO targets(target_name, target_desc) VALUES ("12.5","By 2030, substantially reduce waste generation through prevention, reduction, recycling and reuse");
INSERT INTO targets(target_name, target_desc) VALUES ("12.6","Encourage companies, especially large and transnational companies, to adopt sustainable practices and to integrate sustainability information into their reporting cycle");
INSERT INTO targets(target_name, target_desc) VALUES ("12.7","Promote public procurement practices that are sustainable, in accordance with national policies and priorities");
INSERT INTO targets(target_name, target_desc) VALUES ("12.8","By 2030, ensure that people everywhere have the relevant information and awareness for sustainable development and lifestyles in harmony with nature");
INSERT INTO targets(target_name, target_desc) VALUES ("12.a","Support developing countries to strengthen their scientific and technological capacity to move towards more sustainable patterns of consumption and production");
INSERT INTO targets(target_name, target_desc) VALUES ("12.b","Develop and implement tools to monitor sustainable development impacts for sustainable tourism that creates jobs and promotes local culture and products");
INSERT INTO targets(target_name, target_desc) VALUES ("12.c","Rationalize inefficient fossil-fuel subsidies that encourage wasteful consumption by removing market distortions, in accordance with national circumstances, including by restructuring taxation and phasing out those harmful subsidies, where they exist, to reflect their environmental impacts, taking fully into account the specific needs and conditions of developing countries and minimizing the possible adverse impacts on their development in a manner that protects the poor and the affected communities");
INSERT INTO targets(target_name, target_desc) VALUES ("13.1","Strengthen resilience and adaptive capacity to climate-related hazards and natural disasters in all countries");
INSERT INTO targets(target_name, target_desc) VALUES ("13.2","Integrate climate change measures into national policies, strategies and planning");
INSERT INTO targets(target_name, target_desc) VALUES ("13.3","Improve education, awareness-raising and human and institutional capacity on climate change mitigation, adaptation, impact reduction and early warning");
INSERT INTO targets(target_name, target_desc) VALUES ("13.a","Implement the commitment undertaken by developed-country parties to the United Nations Framework Convention on Climate Change to a goal of mobilizing jointly $100 billion annually by 2020 from all sources to address the needs of developing countries in the context of meaningful mitigation actions and transparency on implementation and fully operationalize the Green Climate Fund through its capitalization as soon as possible");
INSERT INTO targets(target_name, target_desc) VALUES ("13.b","Promote mechanisms for raising capacity for effective climate change-related planning and management in least developed countries and small island developing States, including focusing on women, youth and local and marginalized communities &nbsp;");
INSERT INTO targets(target_name, target_desc) VALUES ("14.1","By 2025, prevent and significantly reduce marine pollution of all kinds, in particular from land-based activities, including marine debris and nutrient pollution");
INSERT INTO targets(target_name, target_desc) VALUES ("14.2","By 2020, sustainably manage and protect marine and coastal ecosystems to avoid significant adverse impacts, including by strengthening their resilience, and take action for their restoration in order to achieve healthy and productive oceans");
INSERT INTO targets(target_name, target_desc) VALUES ("14.3","Minimize and address the impacts of ocean acidification, including through enhanced scientific cooperation at all levels");
INSERT INTO targets(target_name, target_desc) VALUES ("14.4","By 2020, effectively regulate harvesting and end overfishing, illegal, unreported and unregulated fishing and destructive fishing practices and implement science-based management plans, in order to restore fish stocks in the shortest time feasible, at least to levels that can produce maximum sustainable yield as determined by their biological characteristics");
INSERT INTO targets(target_name, target_desc) VALUES ("14.5","By 2020, conserve at least 10 per cent of coastal and marine areas, consistent with national and international law and based on the best available scientific information");
INSERT INTO targets(target_name, target_desc) VALUES ("14.6","By 2020, prohibit certain forms of fisheries subsidies which contribute to overcapacity and overfishing, eliminate subsidies that contribute to illegal, unreported and unregulated fishing and refrain from introducing new such subsidies, recognizing that appropriate and effective special and differential treatment for developing and least developed countries should be an integral part of the World Trade Organization fisheries subsidies negotiation");
INSERT INTO targets(target_name, target_desc) VALUES ("14.7","By 2030, increase the economic benefits to Small Island developing States and least developed countries from the sustainable use of marine resources, including through sustainable management of fisheries, aquaculture and tourism");
INSERT INTO targets(target_name, target_desc) VALUES ("14.a","Increase scientific knowledge, develop research capacity and transfer marine technology, taking into account the Intergovernmental Oceanographic Commission Criteria and Guidelines on the Transfer of Marine Technology, in order to improve ocean health and to enhance the contribution of marine biodiversity to the development of developing countries, in particular small island developing States and least developed countries");
INSERT INTO targets(target_name, target_desc) VALUES ("14.b","Provide access for small-scale artisanal fishers to marine resources and markets");
INSERT INTO targets(target_name, target_desc) VALUES ("14.c","Enhance the conservation and sustainable use of oceans and their resources by implementing international law as reflected in United Nations Convention on the Law of the Sea, which provides the legal framework for the conservation and sustainable use of oceans and their resources, as recalled in paragraph 158 of The future we want");
INSERT INTO targets(target_name, target_desc) VALUES ("15.1","By 2020, ensure the conservation, restoration and sustainable use of terrestrial and inland freshwater ecosystems and their services, in particular forests, wetlands, mountains and drylands, in line with obligations under international agreements"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.2","By 2020, promote the implementation of sustainable management of all types of forests, halt deforestation, restore degraded forests and substantially increase afforestation and reforestation globally"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.3","By 2030, combat desertification, restore degraded land and soil, including land affected by desertification, drought and floods, and strive to achieve a land degradation-neutral world"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.4","By 2030, ensure the conservation of mountain ecosystems, including their biodiversity, in order to enhance their capacity to provide benefits that are essential for sustainable development"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.5","Take urgent and significant action to reduce the degradation of natural habitats, halt the loss of biodiversity and, by 2020, protect and prevent the extinction of threatened species"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.6","Promote fair and equitable sharing of the benefits arising from the utilization of genetic resources and promote appropriate access to such resources, as internationally agreed"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.7","Take urgent action to end poaching and trafficking of protected species of flora and fauna and address both demand and supply of illegal wildlife products"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.8","By 2020, introduce measures to prevent the introduction and significantly reduce the impact of invasive alien species on land and water ecosystems and control or eradicate the priority species"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.9","By 2020, integrate ecosystem and biodiversity values into national and local planning, development processes, poverty reduction strategies and accounts"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.a","Mobilize and significantly increase financial resources from all sources to conserve and sustainably use biodiversity and ecosystems"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.b","Mobilize significant resources from all sources and at all levels to finance sustainable forest management and provide adequate incentives to developing countries to advance such management, including for conservation and reforestation"); 
INSERT INTO targets(target_name, target_desc) VALUES ("15.c","Enhance global support for efforts to combat poaching and trafficking of protected species, including by increasing the capacity of local communities to pursue sustainable livelihood opportunities"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.1","Significantly reduce all forms of violence and related death rates everywhere"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.2","End abuse, exploitation, trafficking and all forms of violence against and torture of children"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.3","Promote the rule of law at the national and international levels and ensure equal access to justice for all"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.4","By 2030, significantly reduce illicit financial and arms flows, strengthen the recovery and return of stolen assets and combat all forms of organized crime"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.5","Substantially reduce corruption and bribery in all their forms"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.6","Develop effective, accountable and transparent institutions at all levels"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.7","Ensure responsive, inclusive, participatory and representative decision-making at all levels"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.8","Broaden and strengthen the participation of developing countries in the institutions of global governance"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.9","By 2030, provide legal identity for all, including birth registration"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.10","Ensure public access to information and protect fundamental freedoms, in accordance with national legislation and international agreements"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.a","Strengthen relevant national institutions, including through international cooperation, for building capacity at all levels, in particular in developing countries, to prevent violence and combat terrorism and crime"); 
INSERT INTO targets(target_name, target_desc) VALUES ("16.b","Promote and enforce non-discriminatory laws and policies for sustainable development"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.1","Strengthen domestic resource mobilization, including through international support to developing countries, to improve domestic capacity for tax and other revenue collection"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.2","Developed countries to implement fully their official development assistance commitments, including the commitment by many developed countries to achieve the target of 0.7 per cent of ODA/GNI to developing countries and 0.15 to 0.20 per cent of ODA/GNI to least developed countries; ODA providers are encouraged to consider setting a target to provide at least 0.20 per cent of ODA/GNI to least developed countries"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.3","Mobilize additional financial resources for developing countries from multiple sources"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.4","Assist developing countries in attaining long-term debt sustainability through coordinated policies aimed at fostering debt financing, debt relief and debt restructuring, as appropriate, and address the external debt of highly indebted poor countries to reduce debt distress"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.5","Adopt and implement investment promotion regimes for least developed countries"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.6","Enhance North-South, South-South and triangular regional and international cooperation on and access to science, technology and innovation and enhance knowledge sharing on mutually agreed terms, including through improved coordination among existing mechanisms, in particular at the United Nations level, and through a global technology facilitation mechanism"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.7","Promote the development, transfer, dissemination and diffusion of environmentally sound technologies to developing countries on favourable terms, including on concessional and preferential terms, as mutually agreed"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.8","Fully operationalize the technology bank and science, technology and innovation capacity-building mechanism for least developed countries by 2017 and enhance the use of enabling technology, in particular information and communications technology"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.9","Enhance international support for implementing effective and targeted capacity-building in developing countries to support national plans to implement all the Sustainable Development Goals, including through North-South, South-South and triangular cooperation"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.10","Promote a universal, rules-based, open, non-discriminatory and equitable multilateral trading system under the World Trade Organization, including through the conclusion of negotiations under its Doha Development Agenda"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.11","Significantly increase the exports of developing countries, in particular with a view to doubling the least developed countries’ share of global exports by 2020"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.12","Realize timely implementation of duty-free and quota-free market access on a lasting basis for all least developed countries, consistent with World Trade Organization decisions, including by ensuring that preferential rules of origin applicable to imports from least developed countries are transparent and simple, and contribute to facilitating market access"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.13","Enhance global macroeconomic stability, including through policy coordination and policy coherence"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.14","Enhance policy coherence for sustainable development"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.15","Respect each country’s policy space and leadership to establish and implement policies for poverty eradication and sustainable development&nbsp;"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.16","Enhance the Global Partnership for Sustainable Development, complemented by multi-stakeholder partnerships that mobilize and share knowledge, expertise, technology and financial resources, to support the achievement of the Sustainable Development Goals in all countries, in particular developing countries"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.17","Encourage and promote effective public, public-private and civil society partnerships, building on the experience and resourcing strategies of partnerships&nbsp;"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.18","By 2020, enhance capacity-building support to developing countries, including for least developed countries and small island developing States, to increase significantly the availability of high-quality, timely and reliable data disaggregated by income, gender, age, race, ethnicity, migratory status, disability, geographic location and other characteristics relevant in national contexts"); 
INSERT INTO targets(target_name, target_desc) VALUES ("17.19","By 2030, build on existing initiatives to develop measurements of progress on sustainable development that complement gross domestic product, and support statistical capacity-building in developing countries"); 

-- insert information to indicator table
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.1.1","Proportion of the population living below the international poverty line by sex, age, employment status and geographical location (urban/rural)x");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.2.1","Proportion of population living below the national poverty line, by sex and age");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.2.2","Proportion of men, women and children of all ages living in poverty in all its dimensions according to national definitions");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.3.1","Proportion of population covered by social protection floors/systems, by sex, distinguishing children, unemployed persons, older persons, persons with disabilities, pregnant women, newborns, work-injury victims and the poor and the vulnerable");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.4.1","Proportion of population living in households with access to basic services");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.4.2","Proportion of total adult population with secure tenure rights to land, (a) with legally recognized documentation, and (b) who perceive their rights to land as secure, by sex and by type of tenure");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.5.1","Number of deaths, missing persons and directly affected persons attributed to disasters per 100,000 population");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.5.2","Direct economic loss attributed to disasters in relation to global gross domestic product (GDP)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.5.3","Number of countries that adopt and implement national disaster risk reduction strategies in line with the Sendai Framework for Disaster Risk Reduction 2015-2030");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.5.4","Proportion of local governments that adopt and implement local disaster risk reduction strategies in line with national disaster risk reduction strategies");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.a.1","Total official development assistance grants from all donors that focus on poverty reduction as a share of the recipient country's gross national income");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.a.2","Proportion of total government spending on essential services (education, health and social protection)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("1.b.1","Pro-poor public social spending");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.1.1","Prevalence of undernourishment");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.1.2","Prevalence of moderate or severe food insecurity in the population, based on the Food Insecurity Experience Scale (FIES)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.2.1","Prevalence of stunting (height for age <-2 standard deviation from the median of the World Health Organization (WHO) Child Growth Standards) among children under 5 years of age");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.2.2","Prevalence of malnutrition (weight for height >+2 or <-2 standard deviation from the median of the WHO Child Growth Standards) among children under 5 years of age, by type (wasting and overweight)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.2.3","Prevalence of anaemia in women aged 15 to 49 years, by pregnancy status (percentage)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.3.1","Volume of production per labour unit by classes of farming/pastoral/forestry enterprise size");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.3.2","Average income of small-scale food producers, by sex and indigenous status");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.4.1","Proportion of agricultural area under productive and sustainable agriculture");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.5.1","Number of (a) plant and (b) animal genetic resources for food and agriculture secured in either medium- or long-term conservation facilities");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.5.2","Proportion of local breeds classified as being at risk of extinction");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.a.1","The agriculture orientation index for government expenditures");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.a.2","Total official flows (official development assistance plus other official flows) to the agriculture sector");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.b.1","Agricultural export subsidies");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("2.c.1","Indicator of food price anomalies");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.1.1","Maternal mortality ratio");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.1.2","Proportion of births attended by skilled health personnel");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.2.1","Under-five mortality rate");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.2.2","Neonatal mortality rate");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.3.1","Number of new HIV infections per 1,000 uninfected population, by sex, age and key populations");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.3.2","Tuberculosis incidence per 100,000 population");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.3.3","Malaria incidence per 1,000 population");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.3.4","Hepatitis B incidence per 100,000 population");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.3.5","Number of people requiring interventions against neglected tropical diseases");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.4.1","Mortality rate attributed to cardiovascular disease, cancer, diabetes or chronic respiratory disease");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.4.2","Suicide mortality rate");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.5.1","Coverage of treatment interventions (pharmacological, psychosocial and rehabilitation and aftercare services) for substance use disorders");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.5.2","Alcohol per capita consumption (aged 15 years and older) within a calendar year in litres of pure alcohol");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.6.1","Death rate due to road traffic injuries");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.7.1","Proportion of women of reproductive age (aged 15-49 years) who have their need for family planning satisfied with modern methods");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.7.2","Adolescent birth rate (aged 10-14 years; aged 15-19 years) per 1,000 women in that age group");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.8.1","Coverage of essential health services");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.8.2","Proportion of population with large household expenditures on health as a share of total household expenditure or income");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.9.1","Mortality rate attributed to household and ambient air pollution");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.9.2","Mortality rate attributed to unsafe water, unsafe sanitation and lack of hygiene (exposure to unsafe Water, Sanitation and Hygiene for All (WASH) services)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.9.3","Mortality rate attributed to unintentional poisoning");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.a.1","Age-standardized prevalence of current tobacco use among persons aged 15 years and older");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.b.1","Proportion of the target population covered by all vaccines included in their national programme");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.b.2","Total net official development assistance to medical research and basic health sectors");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.b.3","Proportion of health facilities that have a core set of relevant essential medicines available and affordable on a sustainable basis");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.c.1","Health worker density and distribution");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.d.1","International Health Regulations (IHR) capacity and health emergency preparedness");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("3.d.2","Percentage of bloodstream infections due to selected antimicrobial-resistant organisms");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.1.1","Proportion of children and young people (a) in grades 2/3; (b) at the end of primary; and (c) at the end of lower secondary achieving at least a minimum proficiency level in (i) reading and (ii) mathematics, by sex");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.1.2","Completion rate (primary education, lower secondary education, upper secondary education)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.2.1","Proportion of children aged 24–59 months who are developmentally on track in health, learning and psychosocial well-being, by sex");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.2.2","Participation rate in organized learning (one year before the official primary entry age), by sex");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.3.1","Participation rate of youth and adults in formal and non-formal education and training in the previous 12 months, by sex");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.4.1","Proportion of youth and adults with information and communications technology (ICT) skills, by type of skill");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.5.1","Parity indices (female/male, rural/urban, bottom/top wealth quintile and others such as disability status, indigenous peoples and conflict-affected, as data become available) for all education indicators on this list that can be disaggregated");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.6.1","Proportion of population in a given age group achieving at least a fixed level of proficiency in functional (a) literacy and (b) numeracy skills, by sex");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.7.1","Extent to which (i) global citizenship education and (ii) education for sustainable development are mainstreamed in (a) national education policies; (b) curricula; (c) teacher education and (d) student assessment");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.a.1","Proportion of schools offering basic services, by type of service");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.b.1","Volume of official development assistance flows for scholarships by sector and type of study");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("4.c.1","Proportion of teachers with the minimum required qualifications, by education level");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.1.1","Whether or not legal frameworks are in place to promote, enforce and monitor equality and non‑discrimination on the basis of sex");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.2.1","Proportion of ever-partnered women and girls aged 15 years and older subjected to physical, sexual or psychological violence by a current or former intimate partner in the previous 12 months, by form of violence and by age");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.2.2","Proportion of women and girls aged 15 years and older subjected to sexual violence by persons other than an intimate partner in the previous 12 months, by age and place of occurrence");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.3.1","Proportion of women aged 20-24 years who were married or in a union before age 15 and before age 18");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.3.2","Proportion of girls and women aged 15-49 years who have undergone female genital mutilation/cutting, by age");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.4.1","Proportion of time spent on unpaid domestic and care work, by sex, age and location");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.5.1","Proportion of seats held by women in (a) national parliaments and (b) local governments");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.5.2","Proportion of women in managerial positions");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.6.1","Proportion of women aged 15-49 years who make their own informed decisions regarding sexual relations, contraceptive use and reproductive health care");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.6.2","Number of countries with laws and regulations that guarantee full and equal access to women and men aged 15 years and older to sexual and reproductive health care, information and education");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.a.1","(a) Proportion of total agricultural population with ownership or secure rights over agricultural land, by sex; and (b) share of women among owners or rights-bearers of agricultural land, by type of tenure");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.a.2","Proportion of countries where the legal framework (including customary law) guarantees women’s equal rights to land ownership and/or control");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.b.1","Proportion of individuals who own a mobile telephone, by sex");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("5.c.1","Proportion of countries with systems to track and make public allocations for gender equality and women’s empowerment");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.1.1","Proportion of population using safely managed drinking water services");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.2.1","Proportion of population using (a) safely managed sanitation services and (b) a hand-washing facility with soap and water");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.3.1","Proportion of domestic and industrial wastewater flows safely treated");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.3.2","Proportion of bodies of water with good ambient water quality");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.4.1","Change in water-use efficiency over time");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.4.2","Level of water stress: freshwater withdrawal as a proportion of available freshwater resources");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.5.1","Degree of integrated water resources management ");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.5.2","Proportion of transboundary basin area with an operational arrangement for water cooperation");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.6.1","Change in the extent of water-related ecosystems over time");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.a.1","Amount of water- and sanitation-related official development assistance that is part of a government-coordinated spending plan");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("6.b.1","Proportion of local administrative units with established and operational policies and procedures for participation of local communities in water and sanitation management");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("7.1.1","Proportion of population with access to electricity");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("7.1.2","Proportion of population with primary reliance on clean fuels and technology");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("7.2.1","Renewable energy share in the total final energy consumption");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("7.3.1","Energy intensity measured in terms of primary energy and GDP");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("7.a.1","International financial flows to developing countries in support of clean energy research and development and renewable energy production, including in hybrid systems");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("7.b.1","Installed renewable energy-generating capacity in developing and developed countries (in watts per capita)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.1.1","Annual growth rate of real GDP per capita");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.2.1","Annual growth rate of real GDP per employed person");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.3.1","Proportion of informal employment in total employment, by sector and sex");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.4.1","Material footprint, material footprint per capita, and material footprint per GDP");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.4.2","Domestic material consumption, domestic material consumption per capita, and domestic material consumption per GDP");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.5.1","Average hourly earnings of female and male employees, by occupation, age and persons with disabilities");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.5.2","Unemployment rate, by sex, age and persons with disabilities");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.6.1","Proportion of youth (aged 15-24 years) not in education, employment or training");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.7.1","Proportion and number of children aged 5‑17 years engaged in child labour, by sex and age");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.8.1","Fatal and non-fatal occupational injuries per 100,000 workers, by sex and migrant status");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.8.2","Level of national compliance with labour rights (freedom of association and collective bargaining) based on International Labour Organization (ILO) textual sources and national legislation, by sex and migrant status");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.9.1","Tourism direct GDP as a proportion of total GDP and in growth rate");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.10.1","(a) Number of commercial bank branches per 100,000 adults and (b) number of automated teller machines (ATMs) per 100,000 adults");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.10.2","Proportion of adults (15 years and older) with an account at a bank or other financial institution or with a mobile-money-service provider");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.a.1","Aid for Trade commitments and disbursements");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("8.b.1","Existence of a developed and operationalized national strategy for youth employment, as a distinct strategy or as part of a national employment strategy");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.1.1","Proportion of the rural population who live within 2 km of an all-season road");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.1.2","Passenger and freight volumes, by mode of transport");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.2.1","Manufacturing value added as a proportion of GDP and per capita");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.2.2","Manufacturing employment as a proportion of total employment");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.3.1","Proportion of small-scale industries in total industry value added");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.3.2","Proportion of small-scale industries with a loan or line of credit");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.4.1","CO2 emission per unit of value added");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.5.1","Research and development expenditure as a proportion of GDP");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.5.2","Researchers (in full-time equivalent) per million inhabitants");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.a.1","Total official international support (official development assistance plus other official flows) to infrastructure");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.b.1","Proportion of medium and high-tech industry value added in total value added");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("9.c.1","Proportion of population covered by a mobile network, by technology");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.1.1","Growth rates of household expenditure or income per capita among the bottom 40 per cent of the population and the total population");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.2.1","Proportion of people living below 50 per cent of median income, by sex, age and persons with disabilities");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.3.1","Proportion of population reporting having personally felt discriminated against or harassed within the previous 12 months on the basis of a ground of discrimination prohibited under international human rights law");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.4.1","Labour share of GDP");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.4.2","Redistributive impact of fiscal policy");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.5.1","Financial Soundness Indicators");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.6.1","Proportion of members and voting rights of developing countries in international organizations");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.7.1","Recruitment cost borne by employee as a proportion of montlhy income earned in country of destination");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.7.2","Number of countries with migration policies that facilitate orderly, safe, regular and responsible migration and mobility of people");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.7.3","Number of people who died or disappeared in the process of migration towards an international destination");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.7.4","Proportion of the population who are refugees, by country of origin");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.a.1","Proportion of tariff lines applied to imports from least developed countries and developing countries with zero-tariff");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.b.1","Total resource flows for development, by recipient and donor countries and type of flow (e.g. official development assistance, foreign direct investment and other flows)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("10.c.1","Remittance costs as a proportion of the amount remitted");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.1.1","Proportion of urban population living in slums, informal settlements or inadequate housing");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.2.1","Proportion of population that has convenient access to public transport, by sex, age and persons with disabilities");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.3.1","Ratio of land consumption rate to population growth rate");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.3.2","Proportion of cities with a direct participation structure of civil society in urban planning and management that operate regularly and democratically");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.4.1","Total per capita expenditure on the preservation, protection and conservation of all cultural and natural heritage, by source of funding (public, private), type of heritage (cultural, natural) and level of government (national, regional, and local/municipal)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.5.1","Number of deaths, missing persons and directly affected persons attributed to disasters per 100,000 population");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.5.2","Direct economic loss attributed to disasters in relation to global domestic product (GDP)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.5.3","(a) Damage to critical infrastructure and (b) number of disruptions to basic services, attributed to disasters");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.6.1","Proportion of municipal solid waste collected and managed in controlled facilities out of total municipal waste generated, by cities");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.6.2","Annual mean levels of fine particulate matter (e.g. PM2.5 and PM10) in cities (population weighted)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.7.1","Average share of the built-up area of cities that is open space for public use for all, by sex, age and persons with disabilities");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.7.2","Proportion of persons victim of non-sexual or sexual harassment, by sex, age, disability status and place of occurrence, in the previous 12 months");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.a.1","Number of countries that have national urban policies or regional development plans that (a) respond to population dynamics; (b) ensure balanced territorial development; and (c) increase local fiscal space");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.b.1","Number of countries that adopt and implement national disaster risk reduction strategies in line with the Sendai Framework for Disaster Risk Reduction 2015–2030");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("11.b.2","Proportion of local governments that adopt and implement local disaster risk reduction strategies in line with national disaster risk reduction strategies");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.1.1","Number of countries developing, adopting or implementing policy instruments aimed at supporting the shift to sustainable consumption and production");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.2.1","Material footprint, material footprint per capita, and material footprint per GDP");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.2.2","Domestic material consumption, domestic material consumption per capita, and domestic material consumption per GDP");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.3.1","(a) Food loss index and (b) food waste index");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.4.1","Number of parties to international multilateral environmental agreements on hazardous waste, and other chemicals that meet their commitments and obligations in transmitting information as required by each relevant agreement");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.4.2","(a) Hazardous waste generated per capita; and (b) proportion of hazardous waste treated, by type of treatment");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.5.1","National recycling rate, tons of material recycled");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.6.1","Number of companies publishing sustainability reports");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.7.1","Number of countries implementing sustainable public procurement policies and action plans");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.8.1","Extent to which (i) global citizenship education and (ii) education for sustainable development are mainstreamed in (a) national education policies; (b) curricula; (c) teacher education; and (d) student assessment");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.a.1","Installed renewable energy-generating capacity in developing and developed countries (in watts per capita)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.b.1","Implementation of standard accounting tools to monitor the economic and environmental aspects of tourism sustainability");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("12.c.1","Amount of fossil-fuel subsidies (production and consumption) per unit of GDP");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("13.1.1","Number of deaths, missing persons and directly affected persons attributed to disasters per 100,000 population");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("13.1.2","Number of countries that adopt and implement national disaster risk reduction strategies in line with the Sendai Framework for Disaster Risk Reduction 2015–2030");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("13.1.3","Proportion of local governments that adopt and implement local disaster risk reduction strategies in line with national disaster risk reduction strategies");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("13.2.1","Number of countries with nationally determined contributions, long-term strategies, national adaptation plans and adaptation communications, as reported to the secretariat of the United Nations Framework Convention on Climate Change");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("13.2.2","Total greenhouse gas emissions per year");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("13.3.1","Extent to which (i) global citizenship education and (ii) education for sustainable development are mainstreamed in (a) national education policies; (b) curricula; (c) teacher education; and (d) student assessment");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("13.a.1","Amounts provided and mobilized in United States dollars per year in relation to the continued existing collective mobilization goal of the $100 billion commitment through to 2025");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("13.b.1","Number of least developed countries and small island developing States with nationally determined contributions, long-term strategies, national adaptation plans and adaptation communications, as reported to the secretariat of the United Nations Framework Convention on Climate Change");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.1.1","(a) Index of coastal eutrophication; and (b) plastic debris density");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.2.1","Number of countries using ecosystem-based approaches to managing marine areas");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.3.1","Average marine acidity (pH) measured at agreed suite of representative sampling stations");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.4.1","Proportion of fish stocks within biologically sustainable levels");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.5.1","Coverage of protected areas in relation to marine areas");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.6.1","Degree of implementation of international instruments aiming to combat illegal, unreported and unregulated fishing");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.7.1","Sustainable fisheries as a proportion of GDP in small island developing States, least developed countries and all countries");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.a.1","Proportion of total research budget allocated to research in the field of marine technology");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.b.1","Degree of application of a legal/regulatory/policy/institutional framework which recognizes and protects access rights for small‐scale fisheries");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("14.c.1","Number of countries making progress in ratifying, accepting and implementing through legal, policy and institutional frameworks, ocean-related instruments that implement international law, as reflected in the United Nations Convention on the Law of the Sea, for the conservation and sustainable use of the oceans and their resources");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.1.1","Forest area as a proportion of total land area");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.1.2","Proportion of important sites for terrestrial and freshwater biodiversity that are covered by protected areas, by ecosystem type");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.2.1","Progress towards sustainable forest management");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.3.1","Proportion of land that is degraded over total land area");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.4.1","Coverage by protected areas of important sites for mountain biodiversity");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.4.2","Mountain Green Cover Index");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.5.1","Red List Index");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.6.1","Number of countries that have adopted legislative, administrative and policy frameworks to ensure fair and equitable sharing of benefits");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.7.1","Proportion of traded wildlife that was poached or illicitly trafficked");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.8.1","Proportion of countries adopting relevant national legislation and adequately resourcing the prevention or control of invasive alien species");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.9.1","(a) Number of countries that have established national targets in accordance with or similar to Aichi Biodiversity Target 2 of the Strategic Plan for Biodiversity 2011–2020 in their national biodiversity strategy and action plans and the progress reported towards these targets; and (b) integration of biodiversity into national accounting and reporting systems, defined as implementation of the System of Environmental-Economic Accounting");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.a.1","(a) Official development assistance on conservation and sustainable use of biodiversity; and (b) revenue generated and finance mobilized from biodiversity-relevant economic instruments");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.b.1","(a) Official development assistance on conservation and sustainable use of biodiversity; and (b) revenue generated and finance mobilized from biodiversity-relevant economic instruments");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("15.c.1","Proportion of traded wildlife that was poached or illicitly trafficked");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.1.1","Number of victims of intentional homicide per 100,000 population, by sex and age");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.1.2","Conflict-related deaths per 100,000 population, by sex, age and cause");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.1.3","Proportion of population subjected to (a) physical violence, (b) psychological violence and/or (c) sexual violence in the previous 12 months");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.1.4","Proportion of population that feel safe walking alone around the area they live after dark");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.2.1","Proportion of children aged 1–17 years who experienced any physical punishment and/or psychological aggression by caregivers in the past month");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.2.2","Number of victims of human trafficking per 100,000 population, by sex, age and form of exploitation");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.2.3","Proportion of young women and men aged 18–29 years who experienced sexual violence by age 18");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.3.1","Proportion of victims of (a) physical, (b) psychological and/or (c) sexual violence in the previous 12 months who reported their victimization to competent authorities or other officially recognized conflict resolution mechanisms");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.3.2","Unsentenced detainees as a proportion of overall prison population");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.3.3","Proportion of the population who have experienced a dispute in the past two years and who accessed a formal or informal dispute resolution mechanism, by type of mechanism");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.4.1","Total value of inward and outward illicit financial flows (in current United States dollars)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.4.2","Proportion of seized, found or surrendered arms whose illicit origin or context has been traced or established by a competent authority in line with international instruments");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.5.1","Proportion of persons who had at least one contact with a public official and who paid a bribe to a public official, or were asked for a bribe by those public officials, during the previous 12 months");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.5.2","Proportion of businesses that had at least one contact with a public official and that paid a bribe to a public official, or were asked for a bribe by those public officials during the previous 12 months");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.6.1","Primary government expenditures as a proportion of original approved budget, by sector (or by budget codes or similar)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.6.2","Proportion of population satisfied with their last experience of public services");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.7.1","Proportions of positions in national and local institutions, including (a) the legislatures; (b) the public service; and (c) the judiciary, compared to national distributions, by sex, age, persons with disabilities and population groups");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.7.2","Proportion of population who believe decision-making is inclusive and responsive, by sex, age, disability and population group");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.8.1","Proportion of members and voting rights of developing countries in international organizations");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.9.1","Proportion of children under 5 years of age whose births have been registered with a civil authority, by age");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.10.1","Number of verified cases of killing, kidnapping, enforced disappearance, arbitrary detention and torture of journalists, associated media personnel, trade unionists and human rights advocates in the previous 12 months");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.10.2","Number of countries that adopt and implement constitutional, statutory and/or policy guarantees for public access to information");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.a.1","Existence of independent national human rights institutions in compliance with the Paris Principles");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("16.b.1","Proportion of population reporting having personally felt discriminated against or harassed in the previous 12 months on the basis of a ground of discrimination prohibited under international human rights law");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.1.1","Total government revenue as a proportion of GDP, by source");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.1.2","Proportion of domestic budget funded by domestic taxes");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.2.1","Net official development assistance, total and to least developed countries, as a proportion of the Organization for Economic Cooperation and Development (OECD) Development Assistance Committee donors’ gross national income (GNI)");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.3.1","Additional financial resources mobilized for developing countries from multiple sources ");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.3.2","Volume of remittances (in United States dollars) as a proportion of total GDP");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.4.1","Debt service as a proportion of exports of goods and services");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.5.1","Number of countries that adopt and implement investment promotion regimes for developing countries, including the least developed countries");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.6.1"," Fixed broadband subscriptions per 100 inhabitants, by speed");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.7.1","Total amount of funding for developing countries to promote the development, transfer, dissemination and diffusion of environmentally sound technologies");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.8.1","Proportion of individuals using the Internet");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.9.1","Dollar value of financial and technical assistance (including through North-South, South‑South and triangular cooperation) committed to developing countries");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.10.1","Worldwide weighted tariff-average");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.11.1","Developing countries’ and least developed countries’ share of global exports");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.12.1","Weighted average tariffs faced by developing countries, least developed countries and small island developing States");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.13.1","Macroeconomic Dashboard");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.14.1","Number of countries with mechanisms in place to enhance policy coherence of sustainable development");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.15.1","Extent of use of country-owned results frameworks and planning tools by providers of development cooperation");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.16.1","Number of countries reporting progress in multi-stakeholder development effectiveness monitoring frameworks that support the achievement of the Sustainable Development Goals");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.17.1","Amount in United States dollars committed to public-private partnerships for infrastructure");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.18.1","Statistical capacity indicators");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.18.2","Number of countries that have national statistical legislation that complies with the Fundamental Principles of Official Statistics");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.18.3","Number of countries with a national statistical plan that is fully funded and under implementation, by source of funding");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.19.1","Dollar value of all resources made available to strengthen statistical capacity in developing countries");
INSERT INTO indicators(indicator_name, indicator_desc) VALUES ("17.19.2","Proportion of countries that (a) have conducted at least one population and housing census in the last 10 years; and (b) have achieved 100 per cent birth registration and 80 per cent death registration");

-- link targets to goals via goal_id
UPDATE targets
SET goal_id = 1
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '1.%'
    ) AS temp
);

UPDATE targets
SET goal_id = 2
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '2.%'
    ) AS temp
);

UPDATE targets
SET goal_id = 3
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '3.%'
    ) AS temp
);

UPDATE targets
SET goal_id = 4
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '4.%'
    ) AS temp
);

UPDATE targets
SET goal_id = 5
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '5.%'
    ) AS temp
);
    
UPDATE targets
SET goal_id = 6
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '6.%'
    ) AS temp
);
    
UPDATE targets
SET goal_id = 7
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '7.%'
    ) AS temp
);
    
UPDATE targets
SET goal_id = 8
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '8.%'
    ) AS temp
);
    
UPDATE targets
SET goal_id = 9
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '9.%'
    ) AS temp
);
    
UPDATE targets
SET goal_id = 10
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '10.%'
    ) AS temp
);

UPDATE targets
SET goal_id = 11
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '11.%'
    ) AS temp
);

UPDATE targets
SET goal_id = 12
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '12.%'
    ) AS temp
);

UPDATE targets
SET goal_id = 13
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '13.%'
    ) AS temp
);

UPDATE targets
SET goal_id = 14
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '14.%'
    ) AS temp
);

UPDATE targets
SET goal_id = 15
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '15.%'
    ) AS temp
);
    
UPDATE targets
SET goal_id = 16
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '16.%'
    ) AS temp
);
    
UPDATE targets
SET goal_id = 17
WHERE target_id IN (
    SELECT temp.target_id
    FROM (
        SELECT target_id
        FROM targets
        WHERE target_name LIKE '17.%'
    ) AS temp
);

-- link indicators to targets via target_id

-- indicators for goal 1
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '1.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 1;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '1.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 2;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '1.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 3;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '1.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 4;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '1.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 5;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '1.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 6;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '1.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 7;

-- indicators for goal 2
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '2.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 8;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '2.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 9;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '2.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 10;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '2.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 11;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '2.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 12;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '2.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 13;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '2.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 14;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '2.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 15;

-- indicators for goal 3
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 16;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 17;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 18;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 19;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 20;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 21;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 22;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.8.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 23;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.9.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 24;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 25;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 26;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 27;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '3.d.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 28;

-- indicators for goal 4
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 29;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 30;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 31;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 32;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 33;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 34;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 35;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 36;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 37;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '4.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 38;

-- indicators for goal 5
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '5.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 39;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '5.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 40;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '5.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 41;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '5.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 42;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '5.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 43;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '5.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 44;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '5.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 45;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '5.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 46;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '5.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 47;

-- indicators for goal 6
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '6.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 48;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '6.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 49;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '6.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 50;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '6.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 51;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '6.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 52;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '6.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 53;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '6.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 54;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '6.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 55;

-- indicators for goal 7
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '7.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 56;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '7.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 57;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '7.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 58;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '7.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 59;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '7.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 60;

-- indicators for goal 8
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 61;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 62;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 63;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 64;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 65;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 66;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 67;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.8.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 68;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.9.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 69;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.10.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 70;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 71;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '8.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 72;

-- indicators for goal 9
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '9.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 73;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '9.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 74;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '9.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 75;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '9.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 76;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '9.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 77;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '9.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 78;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '9.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 79;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '9.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 80;

-- indicators for goal 10
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 81;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 82;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 83;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 84;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 85;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 86;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 87;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 88;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 89;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '10.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 90;

-- indicators for goal 11
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 91;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 92;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 93;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 94;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 95;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 96;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 97;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 98;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 99;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '11.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 100;

-- indicators for goal 12
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 101;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 102;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 103;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 104;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 105;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 106;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 107;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.8.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 108;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 109;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 110;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '12.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 111;

-- indicators for goal 13
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '13.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 112;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '13.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 113;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '13.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 114;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '13.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 115;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '13.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 116;

-- indicators for goal 14
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 117;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 118;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 119;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 120;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 121;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 122;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 123;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 124;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 125;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '14.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 126;

-- indicators for goal 15
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 127;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 128;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 129;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 130;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 131;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 132;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 133;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.8.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 134;


UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.9.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 135;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 136;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 137;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '15.c.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 138;

-- indicators for goal 16
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 139;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 140;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 141;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 142;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 143;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 144;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 145;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.8.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 146;


UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.9.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 147;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.10.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 148;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.a.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 149;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '16.b.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 150;

-- indicators for goal 16
UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.1.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 151;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.2.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 152;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.3.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 153;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.4.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 154;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.5.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 155;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.6.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 156;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.7.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 157;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.8.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 158;


UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.9.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 159;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.10.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 160;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.11.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 161;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.12.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 162;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.13.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 163;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.14.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 164;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.15.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 165;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.16.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 166;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.17.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 167;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.18.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 168;

UPDATE indicators AS i
JOIN (
    SELECT indicator_id
    FROM indicators
    WHERE indicator_name LIKE '17.19.%'
) AS temp ON i.indicator_id = temp.indicator_id
SET i.target_id = 169;

INSERT INTO roles(role_name) VALUES("Administrator");
INSERT INTO roles(role_name) VALUES("Academic Lead");
INSERT INTO roles(role_name) VALUES("Researcher");
SELECT user_id FROM projects;

/*...DUMMY DATA FOR TESTING PURPOSES...*/

INSERT INTO users(user_name, user_email, role_id) VALUES("Jon Dexter", "jdexter@saskpolytech.ca", 1);
INSERT INTO users(user_name, user_email, role_id) VALUES("Brian Cidras", "bcidras@saskpolytech.ca", 3);
INSERT INTO users(user_name, user_email, role_id) VALUES("Elinor Johnson", "ejohnson@saskpolytech.ca", 3);
INSERT INTO users(user_name, user_email, role_id) VALUES("Edward Brown", "ebrown@saskpolytech.ca", 2);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Sustainable Fishing in Lakes", "Fishing is a popular sport that has an constantly growing stream of participants. The increasing number of people fishing has harmed the local edible fish population over the years. Our project aims to...", 2, "", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (1, 53);
INSERT INTO projects_targets(project_id, target_id) VALUES (1, 102);
INSERT INTO projects_targets(project_id, target_id) VALUES (1, 108);
INSERT INTO projects_targets(project_id, target_id) VALUES (1, 118);
INSERT INTO projects_targets(project_id, target_id) VALUES (1, 127);
INSERT INTO projects_targets(project_id, target_id) VALUES (1, 131);
INSERT INTO projects_targets(project_id, target_id) VALUES (1, 136);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Improving Water Quality at the Local reservoir", "The current infrastructure that we use to treat the city of Saskatoon's water is approaching maximum capacity. Our project aims to...", 3, "Water", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (2, 50);
INSERT INTO projects_targets(project_id, target_id) VALUES (2, 55);
INSERT INTO projects_targets(project_id, target_id) VALUES (2, 73);
INSERT INTO projects_targets(project_id, target_id) VALUES (2, 76);
INSERT INTO projects_targets(project_id, target_id) VALUES (2, 95);
INSERT INTO projects_targets(project_id, target_id) VALUES (2, 96);
INSERT INTO projects_targets(project_id, target_id) VALUES (2, 104);
INSERT INTO projects_targets(project_id, target_id) VALUES (2, 127);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Reducing Food Wastage at USask", "A previous study of the amount of food thrown out on a daily basis at USask is enough that it could be of great benefit to vulnerable groups. Our project aims to...", 3, "Zero Hunger", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (3, 8);
INSERT INTO projects_targets(project_id, target_id) VALUES (3, 103);
INSERT INTO projects_targets(project_id, target_id) VALUES (3, 114);
INSERT INTO projects_targets(project_id, target_id) VALUES (3, 167);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Renewable Energy in Rural Areas", "Many rural areas lack access to reliable energy sources. Our project aims to implement solar and wind energy solutions to provide sustainable power.", 2, "Affordable and Clean Energy", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (4, 56);
INSERT INTO projects_targets(project_id, target_id) VALUES (4, 57);
INSERT INTO projects_targets(project_id, target_id) VALUES (4, 58);
INSERT INTO projects_targets(project_id, target_id) VALUES (4, 59);
INSERT INTO projects_targets(project_id, target_id) VALUES (4, 76);
INSERT INTO projects_targets(project_id, target_id) VALUES (4, 112);
INSERT INTO projects_targets(project_id, target_id) VALUES (4, 157);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Urban Community Gardens", "Urban spaces often lack greenery and fresh produce. Our project focuses on creating community gardens to enhance urban biodiversity and provide fresh vegetables.", 3, "Sustainable Cities", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (5, 11);
INSERT INTO projects_targets(project_id, target_id) VALUES (5, 24);
INSERT INTO projects_targets(project_id, target_id) VALUES (5, 94);
INSERT INTO projects_targets(project_id, target_id) VALUES (5, 95);
INSERT INTO projects_targets(project_id, target_id) VALUES (5, 102);
INSERT INTO projects_targets(project_id, target_id) VALUES (5, 129);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Recycling Education Program", "Recycling habits in our community are suboptimal. This project aims to educate the public on effective recycling practices and reduce waste.", 3, "Responsible Consumption", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (6, 53);
INSERT INTO projects_targets(project_id, target_id) VALUES (6, 96);
INSERT INTO projects_targets(project_id, target_id) VALUES (6, 102);
INSERT INTO projects_targets(project_id, target_id) VALUES (6, 104);
INSERT INTO projects_targets(project_id, target_id) VALUES (6, 105);
INSERT INTO projects_targets(project_id, target_id) VALUES (6, 108);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Wildlife Conservation in Local Forests", "Local forests are home to diverse wildlife that is threatened by urban expansion. Our project aims to protect these species and their habitats.", 2, "Life on Land", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 94);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 108);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 113);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 117);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 118);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 127);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 128);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 130);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 131);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 135);
INSERT INTO projects_targets(project_id, target_id) VALUES (7, 136);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Smart Irrigation Systems", "Water scarcity affects agriculture productivity. Our project aims to develop and implement smart irrigation systems that conserve water and improve crop yields.", 2, "Clean Water and Sanitation", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (8, 11);
INSERT INTO projects_targets(project_id, target_id) VALUES (8, 51);
INSERT INTO projects_targets(project_id, target_id) VALUES (8, 52);
INSERT INTO projects_targets(project_id, target_id) VALUES (8, 53);
INSERT INTO projects_targets(project_id, target_id) VALUES (8, 55);
INSERT INTO projects_targets(project_id, target_id) VALUES (8, 102);
INSERT INTO projects_targets(project_id, target_id) VALUES (8, 104);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Plastic Waste Reduction Initiative", "Plastic pollution is a significant environmental issue. This project aims to reduce plastic waste through community initiatives and alternative materials.", 2, "Life Below Water", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (9, 50);
INSERT INTO projects_targets(project_id, target_id) VALUES (9, 76);
INSERT INTO projects_targets(project_id, target_id) VALUES (9, 96);
INSERT INTO projects_targets(project_id, target_id) VALUES (9, 97);
INSERT INTO projects_targets(project_id, target_id) VALUES (9, 104);
INSERT INTO projects_targets(project_id, target_id) VALUES (9, 105);
INSERT INTO projects_targets(project_id, target_id) VALUES (9, 114);
INSERT INTO projects_targets(project_id, target_id) VALUES (9, 117);
INSERT INTO projects_targets(project_id, target_id) VALUES (9, 119);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Youth Empowerment through Education", "Many youths lack access to quality education. Our project aims to provide educational resources and opportunities to underprivileged youth.", 2, "Quality Education", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (10, 29);
INSERT INTO projects_targets(project_id, target_id) VALUES (10, 31);
INSERT INTO projects_targets(project_id, target_id) VALUES (10, 33);
INSERT INTO projects_targets(project_id, target_id) VALUES (10, 35);
INSERT INTO projects_targets(project_id, target_id) VALUES (10, 66);
INSERT INTO projects_targets(project_id, target_id) VALUES (10, 82);
INSERT INTO projects_targets(project_id, target_id) VALUES (10, 140);
INSERT INTO projects_targets(project_id, target_id) VALUES (10, 159);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Affordable Housing Development", "Housing costs are rising, making it difficult for many to find affordable living spaces. Our project focuses on developing affordable housing solutions.", 3, "No Poverty", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (11, 1);
INSERT INTO projects_targets(project_id, target_id) VALUES (11, 4);
INSERT INTO projects_targets(project_id, target_id) VALUES (11, 5);
INSERT INTO projects_targets(project_id, target_id) VALUES (11, 91);
INSERT INTO projects_targets(project_id, target_id) VALUES (11, 93);
INSERT INTO projects_targets(project_id, target_id) VALUES (11, 96);
INSERT INTO projects_targets(project_id, target_id) VALUES (11, 97);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Mental Health Awareness Campaign", "Mental health issues are often stigmatized and neglected. This project aims to raise awareness and provide support for mental health in the community.", 2, "Good Health and Well-being", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (12, 19);
INSERT INTO projects_targets(project_id, target_id) VALUES (12, 20);
INSERT INTO projects_targets(project_id, target_id) VALUES (12, 23);
INSERT INTO projects_targets(project_id, target_id) VALUES (12, 24);

INSERT INTO projects(project_name, project_desc, user_id, tag, project_time_created) VALUES("Tech Literacy for Seniors", "Senior citizens often struggle with new technologies. Our project provides training and resources to help seniors navigate the digital world.", 2, "Reduced Inequalities", current_date());
INSERT INTO projects_targets(project_id, target_id) VALUES (13, 31);
INSERT INTO projects_targets(project_id, target_id) VALUES (13, 32);
INSERT INTO projects_targets(project_id, target_id) VALUES (13, 34);
INSERT INTO projects_targets(project_id, target_id) VALUES (13, 73);
INSERT INTO projects_targets(project_id, target_id) VALUES (13, 82);
INSERT INTO projects_targets(project_id, target_id) VALUES (13, 83);

/*...DUMMY DATA FOR TESTING PURPOSES...*/
