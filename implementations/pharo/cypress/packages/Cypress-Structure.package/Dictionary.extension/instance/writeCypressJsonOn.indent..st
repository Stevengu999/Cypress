*Cypress-Structure
writeCypressJsonOn: aStream indent: startIndent
    | indent count |
    indent := startIndent.
    aStream
        nextPutAll: '{';
        lf.
    count := 0.
    indent := indent + 1.
    (self keys sort: [ :a :b | a <= b ])
        do: [ :key | 
            | value |
            value := self at: key.
            count := count + 1.
            aStream tab: indent.
            key writeCypressJsonOn: aStream indent: indent.
            aStream nextPutAll: ' : '.
            value writeCypressJsonOn: aStream indent: indent.
            count < self size
                ifTrue: [ 
                    aStream
                        nextPutAll: ',';
                        lf ] ].
    self size = 0
        ifTrue: [ aStream tab: indent ].
    aStream nextPutAll: ' }'