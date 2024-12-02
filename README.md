#### escape_fix.lua

修复rime的express_editor/fluid_editor在触发了Escape按键效果清除当前输入内容后，未正确拦截Escape键而将其发送给当前应用程序的Bug



##### 使用方法：

1. 将escape_fix.lua文件放在用户配置的lua目录下
2. 在配置文件中修改processors，将该脚本放在express_editor/fluid_editor之前

- 例如：
  - rime_ice.custom.yaml

```yaml
patch:
  engine/processors:
    ...
    - lua_processor@*escape_fix
    - express_editor
```