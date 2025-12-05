from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
from robot.api.deco import keyword
import time

@keyword("Pop up Scrolling")
def scroll_to_modena():
    selenium_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    driver = selenium_lib.driver  # Access the active WebDriver
    modena = driver.find_element(By.XPATH, "//span[contains(text(),'Last Modified By')]")
    driver.execute_script("arguments[0].scrollIntoView();", modena)
    # modena.click()  # Uncomment if needed
    time.sleep(10)
