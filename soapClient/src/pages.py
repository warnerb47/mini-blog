def homePage():
    print()
    print()
    print('  *********************************************************')
    print('||                       WELCOME TO                       ||')
    print('||               MINI BLOG DASHBOARD CONSOLE APP          ||')
    print('  *********************************************************')
    print()
    print()
    print('                 Select from menu')
    print('                 ================')
    print('              1--> display list of users')
    print('              2--> display one user')
    print('              3--> create new user')
    print('              4--> delete user')
    print('              q--> Quit')
    print()
    print('                 Your choice: ')
    print("                 ============")


def listOfUsersPage(customers):
    print()
    print()
    print('                 List of users')
    print('                 =============')
    print()
    print()
    print('**************************************************************')
    print('|        name        |       login      |      password      |')
    print('**************************************************************')
    for customer in customers:
            # print(' .................................................................')
            print('|        {name}        |       {login}      |      {password}      '
            .format(name=customer['name'], login=customer['login'], password=customer['password']))
            print(' ..................................................................')


def newUserPage():
    print()
    print()
    print('                 New user')
    print('                 =============')
    print()
    print('Please give user information with this format:')
    print('name|login|password')

def deleteUserPage():
    print()
    print()
    print('                 Delete user')
    print('                 =============')
    print()
    print('Please give user id:')