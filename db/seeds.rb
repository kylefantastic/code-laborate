#developer user
User.create(first_name: "Don",
            last_name: "Duck",
            email: "don@donaldduck.com",
            password: "password")

#organization admin user
User.create(first_name: "Minney",
             last_name: "Mouse",
             email: "minney@mickeymouse.com",
             password: "password",
             organization_id: 1,
             org_affiliate: true)

# Organizations
Organization.create(name: "San Francisco Baykeeper", website_url: 'https://baykeeper.org/', description: "San Francisco Baykeeper is a nonprofit environmental advocacy organization that works to protect, preserve, and enhance the health of the ecosystems and communities that depend upon the San Francisco Bay. For seventeen years, Baykeeper has stood guard over the waters of the San Francisco Bay-Delta Estuary and its watershed. These waters, in addition to their recreational value and biological productivity, also provide drinking water for more than 23 million people and serve as the cornerstone of California's $7 billion economy.")
Organization.create(name: "Global Lives Project", website_url: 'http://globallives.org/', description: 'The Global Lives Project is a nonprofit organization[1] consisting of volunteer filmmakers and photographers, programmers and engineers, architects and designers, students and scholars. The mission of the organization is to collaboratively build a video library of human life experience that reshapes how individuals conceive of cultures, nations and people outside of their own communities.[2]')
Organization.create(name: 'Equality California', website_url: 'http://www.eqca.org/', description: 'Equality California or EQCA is a non-profit civil rights organization that advocates for the rights of LGBT people in California. The organization is a member of the Equality Federation.[1]')
Organization.create(name: 'Rooted in Community', website_url: 'http://www.rootedincommunity.org/', description: 'The Rooted In Community National Network (RIC) is a national grassroots network that empowers young people to take leadership in their own communities. We are a diverse movement of youth and adults working together and committed to fostering healthy communities and food justice through urban and rural agriculture, community gardening, food security, and related environmental justice work.')
Organization.create(name: "Berkeley Youth Alternatives", website_url: 'http://www.byaonline.org/', description:'Berkeley Youth Alternatives is a community based organization. Our vision is to provide a secure and nurturing environment for all the children, youth, and families of our community. We desire to promote, to their fullest potential, the freedom to develop individual skills and visions of the world.')
Organization.create(name: 'JustGive', website_url: 'https://www.justgive.org/', description: 'JustGive is a nonprofit organization whose mission is to increase charitable giving by connecting people with the charities and causes they care most about. It offers donors many innovative ways to give, provides nonprofits with the ability to collect donations online, and creates giving campaigns and systems for companies who want to incorporate social responsibility into their business model.')
Organization.create(name: 'Pollinator Partnership', website_url: 'http://www.pollinator.org/', description:'The Pollinator Partnership or P2 is a 501(c)(3) non-profit organization headquartered in San Francisco, California that works to protect the health of managed and native pollinating animals that are vital to wildland and agricultural ecosystems. The Pollinator Partnership’s mission of environmental stewardship and pollinator protection is achieved through conservation, policy, education, and research. Signature initiatives include the NAPPC (North American Pollinator Protection Campaign), National Pollinator Week,[1] and EcoRegional Planting Guides [2] that allow local citizens to plant gardens that provide habitats for important pollinating species.')

# Projects
Project.create(
    title: 'Trash-tracker',
    vision: 'We are in need of an app that can compile all of the data we gather about trash on the shores of the California Coast.',
    need: 'need',
    description: '',
    benefit: benefit,
    contact_name: ,
    contact_email: contact_email,
    contact_phone: contact_phone,
    deadline: ,
    organization_id: 1
)

Project.create(
    title: 'Garden Calculations',
    vision: 'We are lo',
    need: need,
    description: description,
    benefit: benefit,
    contact_name: cname,
    contact_email: contact_email,
    contact_phone: contact_phone,
    deadline: deadline,
    organization_id: 4
)

Project.create(
    title: title,
    vision: vision,
    need: need,
    description: description,
    benefit: benefit,
    contact_name: cname,
    contact_email: contact_email,
    contact_phone: contact_phone,
    deadline: deadline,
    organization_id: 5
)


Project.create(
    title: title,
    vision: vision,
    need: need,
    description: description,
    benefit: benefit,
    contact_name: cname,
    contact_email: contact_email,
    contact_phone: contact_phone,
    deadline: deadline,
    organization_id: 2
)

Project.create(
    title: title,
    vision: vision,
    need: need,
    description: description,
    benefit: benefit,
    contact_name: cname,
    contact_email: contact_email,
    contact_phone: contact_phone,
    deadline: deadline,
    organization_id: 3
)

Project.create(
    title: title,
    vision: vision,
    need: need,
    description: description,
    benefit: benefit,
    contact_name: cname,
    contact_email: contact_email,
    contact_phone: contact_phone,
    deadline: deadline,
    organization_id: 6
)

Project.create(
    title: title,
    vision: vision,
    need: need,
    description: description,
    benefit: benefit,
    contact_name: cname,
    contact_email: contact_email,
    contact_phone: contact_phone,
    deadline: deadline,
    organization_id: 7
)

Project.create(
    title: title,
    vision: vision,
    need: need,
    description: description,
    benefit: benefit,
    contact_name: cname,
    contact_email: contact_email,
    contact_phone: contact_phone,
    deadline: deadline,
    organization_id:
)

# Categories
categories = ["activism", "animals", "arts", "education", "equality", "government", "health", "international", "recreation", "religion", "research", "science", "social", "youth/children", "other"]

categories.each do |category|
    Category.create(name: category)
end


