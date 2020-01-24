# Examples
Some examples in java

```Java
@Component
public class BaseHandler implements MessageHandler {

    private final ShowInventory showInventory;
    private final ShowPlayerInfo showPlayerInfo;

    @Autowired
    public BaseHandler(ShowInventory showInventory, ShowPlayerInfo showPlayerInfo) {
        this.showInventory = showInventory;
        this.showPlayerInfo = showPlayerInfo;
    }
}
```

source code: https://github.com/nordmine/examples.git
