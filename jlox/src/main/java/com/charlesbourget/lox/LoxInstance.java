package com.charlesbourget.lox;

import com.charlesbourget.lox.error.RuntimeError;

import java.util.HashMap;
import java.util.Map;

public class LoxInstance {
    private final Map<String, Object> fields = new HashMap<>();
    private final LoxClass klass;

    LoxInstance(LoxClass klass) {
        this.klass = klass;
    }

    Object get(Token name) {
        if (fields.containsKey(name.lexeme)) {
            return fields.get(name.lexeme);
        }

        LoxFunction method = klass.findMethod(name.lexeme);

        if (method != null) {
            return method.bind(this);
        }

        throw new RuntimeError(name, String.format("Undefined property '%s'.", name.lexeme));
    }

    void set(Token name, Object value) {
        fields.put(name.lexeme, value);
    }

    @Override
    public String toString() {
        return String.format("%s instance", klass);
    }
}
