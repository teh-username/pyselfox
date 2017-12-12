from selenium import webdriver
from pyvirtualdisplay import Display

if __name__ == '__main__':
    print('Starting up Display')
    display = Display(visible=0, size=(800, 800))
    display.start()

    print('Getting Driver')
    driver = webdriver.Firefox()

    print('Visiting google.com')
    driver.get('https://google.com')

    print('Done! Cleaning up!')
    driver.close()
    driver.quit()
    display.stop()
