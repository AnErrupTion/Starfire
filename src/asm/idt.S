.extern interruptHandler

.global irq0
.type irq0, @function
.align 8

irq0:
    push $0 // Error code
    push $0 // IRQ number
    jmp isr_handler

.global irq1
.type irq1, @function
.align 8

irq1:
    push $0 // Error code
    push $1 // IRQ number
    jmp isr_handler

.global irq2
.type irq2, @function
.align 8

irq2:
    push $0 // Error code
    push $2 // IRQ number
    jmp isr_handler

.global irq3
.type irq3, @function
.align 8

irq3:
    push $0 // Error code
    push $3 // IRQ number
    jmp isr_handler

.global irq4
.type irq4, @function
.align 8

irq4:
    push $0 // Error code
    push $4 // IRQ number
    jmp isr_handler

.global irq5
.type irq5, @function
.align 8

irq5:
    push $0 // Error code
    push $5 // IRQ number
    jmp isr_handler

.global irq6
.type irq6, @function
.align 8

irq6:
    push $0 // Error code
    push $6 // IRQ number
    jmp isr_handler

.global irq7
.type irq7, @function
.align 8

irq7:
    push $0 // Error code
    push $7 // IRQ number
    jmp isr_handler

.global irq8
.type irq8, @function
.align 8

irq8:
    push $8 // IRQ number
    jmp isr_handler

.global irq9
.type irq9, @function
.align 8

irq9:
    push $0 // Error code
    push $9 // IRQ number
    jmp isr_handler

.global irq10
.type irq10, @function
.align 8

irq10:
    push $10 // IRQ number
    jmp isr_handler

.global irq11
.type irq11, @function
.align 8

irq11:
    push $11 // IRQ number
    jmp isr_handler

.global irq12
.type irq12, @function
.align 8

irq12:
    push $12 // IRQ number
    jmp isr_handler

.global irq13
.type irq13, @function
.align 8

irq13:
    push $13 // IRQ number
    jmp isr_handler

.global irq14
.type irq14, @function
.align 8

irq14:
    push $14 // IRQ number
    jmp isr_handler

.global irq15
.type irq15, @function
.align 8

irq15:
    push $0 // Error code
    push $15 // IRQ number
    jmp isr_handler

.global irq16
.type irq16, @function
.align 8

irq16:
    push $0 // Error code
    push $16 // IRQ number
    jmp isr_handler

.global irq17
.type irq17, @function
.align 8

irq17:
    push $17 // IRQ number
    jmp isr_handler

.global irq18
.type irq18, @function
.align 8

irq18:
    push $0 // Error code
    push $18 // IRQ number
    jmp isr_handler

.global irq19
.type irq19, @function
.align 8

irq19:
    push $0 // Error code
    push $19 // IRQ number
    jmp isr_handler

.global irq20
.type irq20, @function
.align 8

irq20:
    push $0 // Error code
    push $20 // IRQ number
    jmp isr_handler

.global irq21
.type irq21, @function
.align 8

irq21:
    push $21 // IRQ number
    jmp isr_handler

.global irq22
.type irq22, @function
.align 8

irq22:
    push $0 // Error code
    push $22 // IRQ number
    jmp isr_handler

.global irq23
.type irq23, @function
.align 8

irq23:
    push $0 // Error code
    push $23 // IRQ number
    jmp isr_handler

.global irq24
.type irq24, @function
.align 8

irq24:
    push $0 // Error code
    push $24 // IRQ number
    jmp isr_handler

.global irq25
.type irq25, @function
.align 8

irq25:
    push $0 // Error code
    push $25 // IRQ number
    jmp isr_handler

.global irq26
.type irq26, @function
.align 8

irq26:
    push $0 // Error code
    push $26 // IRQ number
    jmp isr_handler

.global irq27
.type irq27, @function
.align 8

irq27:
    push $0 // Error code
    push $27 // IRQ number
    jmp isr_handler

.global irq28
.type irq28, @function
.align 8

irq28:
    push $0 // Error code
    push $28 // IRQ number
    jmp isr_handler

.global irq29
.type irq29, @function
.align 8

irq29:
    push $29 // IRQ number
    jmp isr_handler

.global irq30
.type irq30, @function
.align 8

irq30:
    push $30 // IRQ number
    jmp isr_handler

.global irq31
.type irq31, @function
.align 8

irq31:
    push $0 // Error code
    push $31 // IRQ number
    jmp isr_handler

.global irq32
.type irq32, @function
.align 8

irq32:
    push $0 // Error code
    push $32 // IRQ number
    jmp isr_handler

.global irq33
.type irq33, @function
.align 8

irq33:
    push $0 // Error code
    push $33 // IRQ number
    jmp isr_handler

.global irq34
.type irq34, @function
.align 8

irq34:
    push $0 // Error code
    push $34 // IRQ number
    jmp isr_handler

.global irq35
.type irq35, @function
.align 8

irq35:
    push $0 // Error code
    push $35 // IRQ number
    jmp isr_handler

.global irq36
.type irq36, @function
.align 8

irq36:
    push $0 // Error code
    push $36 // IRQ number
    jmp isr_handler

.global irq37
.type irq37, @function
.align 8

irq37:
    push $0 // Error code
    push $37 // IRQ number
    jmp isr_handler

.global irq38
.type irq38, @function
.align 8

irq38:
    push $0 // Error code
    push $38 // IRQ number
    jmp isr_handler

.global irq39
.type irq39, @function
.align 8

irq39:
    push $0 // Error code
    push $39 // IRQ number
    jmp isr_handler

.global irq40
.type irq40, @function
.align 8

irq40:
    push $0 // Error code
    push $40 // IRQ number
    jmp isr_handler

.global irq41
.type irq41, @function
.align 8

irq41:
    push $0 // Error code
    push $41 // IRQ number
    jmp isr_handler

.global irq42
.type irq42, @function
.align 8

irq42:
    push $0 // Error code
    push $42 // IRQ number
    jmp isr_handler

.global irq43
.type irq43, @function
.align 8

irq43:
    push $0 // Error code
    push $43 // IRQ number
    jmp isr_handler

.global irq44
.type irq44, @function
.align 8

irq44:
    push $0 // Error code
    push $44 // IRQ number
    jmp isr_handler

.global irq45
.type irq45, @function
.align 8

irq45:
    push $0 // Error code
    push $45 // IRQ number
    jmp isr_handler

.global irq46
.type irq46, @function
.align 8

irq46:
    push $0 // Error code
    push $46 // IRQ number
    jmp isr_handler

.global irq47
.type irq47, @function
.align 8

irq47:
    push $0 // Error code
    push $47 // IRQ number
    jmp isr_handler

.global irq48
.type irq48, @function
.align 8

irq48:
    push $0 // Error code
    push $48 // IRQ number
    jmp isr_handler

.global irq49
.type irq49, @function
.align 8

irq49:
    push $0 // Error code
    push $49 // IRQ number
    jmp isr_handler

.global irq50
.type irq50, @function
.align 8

irq50:
    push $0 // Error code
    push $50 // IRQ number
    jmp isr_handler

.global irq51
.type irq51, @function
.align 8

irq51:
    push $0 // Error code
    push $51 // IRQ number
    jmp isr_handler

.global irq52
.type irq52, @function
.align 8

irq52:
    push $0 // Error code
    push $52 // IRQ number
    jmp isr_handler

.global irq53
.type irq53, @function
.align 8

irq53:
    push $0 // Error code
    push $53 // IRQ number
    jmp isr_handler

.global irq54
.type irq54, @function
.align 8

irq54:
    push $0 // Error code
    push $54 // IRQ number
    jmp isr_handler

.global irq55
.type irq55, @function
.align 8

irq55:
    push $0 // Error code
    push $55 // IRQ number
    jmp isr_handler

.global irq56
.type irq56, @function
.align 8

irq56:
    push $0 // Error code
    push $56 // IRQ number
    jmp isr_handler

.global irq57
.type irq57, @function
.align 8

irq57:
    push $0 // Error code
    push $57 // IRQ number
    jmp isr_handler

.global irq58
.type irq58, @function
.align 8

irq58:
    push $0 // Error code
    push $58 // IRQ number
    jmp isr_handler

.global irq59
.type irq59, @function
.align 8

irq59:
    push $0 // Error code
    push $59 // IRQ number
    jmp isr_handler

.global irq60
.type irq60, @function
.align 8

irq60:
    push $0 // Error code
    push $60 // IRQ number
    jmp isr_handler

.global irq61
.type irq61, @function
.align 8

irq61:
    push $0 // Error code
    push $61 // IRQ number
    jmp isr_handler

.global irq62
.type irq62, @function
.align 8

irq62:
    push $0 // Error code
    push $62 // IRQ number
    jmp isr_handler

.global irq63
.type irq63, @function
.align 8

irq63:
    push $0 // Error code
    push $63 // IRQ number
    jmp isr_handler

.global irq64
.type irq64, @function
.align 8

irq64:
    push $0 // Error code
    push $64 // IRQ number
    jmp isr_handler

.global irq65
.type irq65, @function
.align 8

irq65:
    push $0 // Error code
    push $65 // IRQ number
    jmp isr_handler

.global irq66
.type irq66, @function
.align 8

irq66:
    push $0 // Error code
    push $66 // IRQ number
    jmp isr_handler

.global irq67
.type irq67, @function
.align 8

irq67:
    push $0 // Error code
    push $67 // IRQ number
    jmp isr_handler

.global irq68
.type irq68, @function
.align 8

irq68:
    push $0 // Error code
    push $68 // IRQ number
    jmp isr_handler

.global irq69
.type irq69, @function
.align 8

irq69:
    push $0 // Error code
    push $69 // IRQ number
    jmp isr_handler

.global irq70
.type irq70, @function
.align 8

irq70:
    push $0 // Error code
    push $70 // IRQ number
    jmp isr_handler

.global irq71
.type irq71, @function
.align 8

irq71:
    push $0 // Error code
    push $71 // IRQ number
    jmp isr_handler

.global irq72
.type irq72, @function
.align 8

irq72:
    push $0 // Error code
    push $72 // IRQ number
    jmp isr_handler

.global irq73
.type irq73, @function
.align 8

irq73:
    push $0 // Error code
    push $73 // IRQ number
    jmp isr_handler

.global irq74
.type irq74, @function
.align 8

irq74:
    push $0 // Error code
    push $74 // IRQ number
    jmp isr_handler

.global irq75
.type irq75, @function
.align 8

irq75:
    push $0 // Error code
    push $75 // IRQ number
    jmp isr_handler

.global irq76
.type irq76, @function
.align 8

irq76:
    push $0 // Error code
    push $76 // IRQ number
    jmp isr_handler

.global irq77
.type irq77, @function
.align 8

irq77:
    push $0 // Error code
    push $77 // IRQ number
    jmp isr_handler

.global irq78
.type irq78, @function
.align 8

irq78:
    push $0 // Error code
    push $78 // IRQ number
    jmp isr_handler

.global irq79
.type irq79, @function
.align 8

irq79:
    push $0 // Error code
    push $79 // IRQ number
    jmp isr_handler

.global irq80
.type irq80, @function
.align 8

irq80:
    push $0 // Error code
    push $80 // IRQ number
    jmp isr_handler

.global irq81
.type irq81, @function
.align 8

irq81:
    push $0 // Error code
    push $81 // IRQ number
    jmp isr_handler

.global irq82
.type irq82, @function
.align 8

irq82:
    push $0 // Error code
    push $82 // IRQ number
    jmp isr_handler

.global irq83
.type irq83, @function
.align 8

irq83:
    push $0 // Error code
    push $83 // IRQ number
    jmp isr_handler

.global irq84
.type irq84, @function
.align 8

irq84:
    push $0 // Error code
    push $84 // IRQ number
    jmp isr_handler

.global irq85
.type irq85, @function
.align 8

irq85:
    push $0 // Error code
    push $85 // IRQ number
    jmp isr_handler

.global irq86
.type irq86, @function
.align 8

irq86:
    push $0 // Error code
    push $86 // IRQ number
    jmp isr_handler

.global irq87
.type irq87, @function
.align 8

irq87:
    push $0 // Error code
    push $87 // IRQ number
    jmp isr_handler

.global irq88
.type irq88, @function
.align 8

irq88:
    push $0 // Error code
    push $88 // IRQ number
    jmp isr_handler

.global irq89
.type irq89, @function
.align 8

irq89:
    push $0 // Error code
    push $89 // IRQ number
    jmp isr_handler

.global irq90
.type irq90, @function
.align 8

irq90:
    push $0 // Error code
    push $90 // IRQ number
    jmp isr_handler

.global irq91
.type irq91, @function
.align 8

irq91:
    push $0 // Error code
    push $91 // IRQ number
    jmp isr_handler

.global irq92
.type irq92, @function
.align 8

irq92:
    push $0 // Error code
    push $92 // IRQ number
    jmp isr_handler

.global irq93
.type irq93, @function
.align 8

irq93:
    push $0 // Error code
    push $93 // IRQ number
    jmp isr_handler

.global irq94
.type irq94, @function
.align 8

irq94:
    push $0 // Error code
    push $94 // IRQ number
    jmp isr_handler

.global irq95
.type irq95, @function
.align 8

irq95:
    push $0 // Error code
    push $95 // IRQ number
    jmp isr_handler

.global irq96
.type irq96, @function
.align 8

irq96:
    push $0 // Error code
    push $96 // IRQ number
    jmp isr_handler

.global irq97
.type irq97, @function
.align 8

irq97:
    push $0 // Error code
    push $97 // IRQ number
    jmp isr_handler

.global irq98
.type irq98, @function
.align 8

irq98:
    push $0 // Error code
    push $98 // IRQ number
    jmp isr_handler

.global irq99
.type irq99, @function
.align 8

irq99:
    push $0 // Error code
    push $99 // IRQ number
    jmp isr_handler

.global irq100
.type irq100, @function
.align 8

irq100:
    push $0 // Error code
    push $100 // IRQ number
    jmp isr_handler

.global irq101
.type irq101, @function
.align 8

irq101:
    push $0 // Error code
    push $101 // IRQ number
    jmp isr_handler

.global irq102
.type irq102, @function
.align 8

irq102:
    push $0 // Error code
    push $102 // IRQ number
    jmp isr_handler

.global irq103
.type irq103, @function
.align 8

irq103:
    push $0 // Error code
    push $103 // IRQ number
    jmp isr_handler

.global irq104
.type irq104, @function
.align 8

irq104:
    push $0 // Error code
    push $104 // IRQ number
    jmp isr_handler

.global irq105
.type irq105, @function
.align 8

irq105:
    push $0 // Error code
    push $105 // IRQ number
    jmp isr_handler

.global irq106
.type irq106, @function
.align 8

irq106:
    push $0 // Error code
    push $106 // IRQ number
    jmp isr_handler

.global irq107
.type irq107, @function
.align 8

irq107:
    push $0 // Error code
    push $107 // IRQ number
    jmp isr_handler

.global irq108
.type irq108, @function
.align 8

irq108:
    push $0 // Error code
    push $108 // IRQ number
    jmp isr_handler

.global irq109
.type irq109, @function
.align 8

irq109:
    push $0 // Error code
    push $109 // IRQ number
    jmp isr_handler

.global irq110
.type irq110, @function
.align 8

irq110:
    push $0 // Error code
    push $110 // IRQ number
    jmp isr_handler

.global irq111
.type irq111, @function
.align 8

irq111:
    push $0 // Error code
    push $111 // IRQ number
    jmp isr_handler

.global irq112
.type irq112, @function
.align 8

irq112:
    push $0 // Error code
    push $112 // IRQ number
    jmp isr_handler

.global irq113
.type irq113, @function
.align 8

irq113:
    push $0 // Error code
    push $113 // IRQ number
    jmp isr_handler

.global irq114
.type irq114, @function
.align 8

irq114:
    push $0 // Error code
    push $114 // IRQ number
    jmp isr_handler

.global irq115
.type irq115, @function
.align 8

irq115:
    push $0 // Error code
    push $115 // IRQ number
    jmp isr_handler

.global irq116
.type irq116, @function
.align 8

irq116:
    push $0 // Error code
    push $116 // IRQ number
    jmp isr_handler

.global irq117
.type irq117, @function
.align 8

irq117:
    push $0 // Error code
    push $117 // IRQ number
    jmp isr_handler

.global irq118
.type irq118, @function
.align 8

irq118:
    push $0 // Error code
    push $118 // IRQ number
    jmp isr_handler

.global irq119
.type irq119, @function
.align 8

irq119:
    push $0 // Error code
    push $119 // IRQ number
    jmp isr_handler

.global irq120
.type irq120, @function
.align 8

irq120:
    push $0 // Error code
    push $120 // IRQ number
    jmp isr_handler

.global irq121
.type irq121, @function
.align 8

irq121:
    push $0 // Error code
    push $121 // IRQ number
    jmp isr_handler

.global irq122
.type irq122, @function
.align 8

irq122:
    push $0 // Error code
    push $122 // IRQ number
    jmp isr_handler

.global irq123
.type irq123, @function
.align 8

irq123:
    push $0 // Error code
    push $123 // IRQ number
    jmp isr_handler

.global irq124
.type irq124, @function
.align 8

irq124:
    push $0 // Error code
    push $124 // IRQ number
    jmp isr_handler

.global irq125
.type irq125, @function
.align 8

irq125:
    push $0 // Error code
    push $125 // IRQ number
    jmp isr_handler

.global irq126
.type irq126, @function
.align 8

irq126:
    push $0 // Error code
    push $126 // IRQ number
    jmp isr_handler

.global irq127
.type irq127, @function
.align 8

irq127:
    push $0 // Error code
    push $127 // IRQ number
    jmp isr_handler

.global irq128
.type irq128, @function
.align 8

irq128:
    push $0 // Error code
    push $128 // IRQ number
    jmp isr_handler

.global irq129
.type irq129, @function
.align 8

irq129:
    push $0 // Error code
    push $129 // IRQ number
    jmp isr_handler

.global irq130
.type irq130, @function
.align 8

irq130:
    push $0 // Error code
    push $130 // IRQ number
    jmp isr_handler

.global irq131
.type irq131, @function
.align 8

irq131:
    push $0 // Error code
    push $131 // IRQ number
    jmp isr_handler

.global irq132
.type irq132, @function
.align 8

irq132:
    push $0 // Error code
    push $132 // IRQ number
    jmp isr_handler

.global irq133
.type irq133, @function
.align 8

irq133:
    push $0 // Error code
    push $133 // IRQ number
    jmp isr_handler

.global irq134
.type irq134, @function
.align 8

irq134:
    push $0 // Error code
    push $134 // IRQ number
    jmp isr_handler

.global irq135
.type irq135, @function
.align 8

irq135:
    push $0 // Error code
    push $135 // IRQ number
    jmp isr_handler

.global irq136
.type irq136, @function
.align 8

irq136:
    push $0 // Error code
    push $136 // IRQ number
    jmp isr_handler

.global irq137
.type irq137, @function
.align 8

irq137:
    push $0 // Error code
    push $137 // IRQ number
    jmp isr_handler

.global irq138
.type irq138, @function
.align 8

irq138:
    push $0 // Error code
    push $138 // IRQ number
    jmp isr_handler

.global irq139
.type irq139, @function
.align 8

irq139:
    push $0 // Error code
    push $139 // IRQ number
    jmp isr_handler

.global irq140
.type irq140, @function
.align 8

irq140:
    push $0 // Error code
    push $140 // IRQ number
    jmp isr_handler

.global irq141
.type irq141, @function
.align 8

irq141:
    push $0 // Error code
    push $141 // IRQ number
    jmp isr_handler

.global irq142
.type irq142, @function
.align 8

irq142:
    push $0 // Error code
    push $142 // IRQ number
    jmp isr_handler

.global irq143
.type irq143, @function
.align 8

irq143:
    push $0 // Error code
    push $143 // IRQ number
    jmp isr_handler

.global irq144
.type irq144, @function
.align 8

irq144:
    push $0 // Error code
    push $144 // IRQ number
    jmp isr_handler

.global irq145
.type irq145, @function
.align 8

irq145:
    push $0 // Error code
    push $145 // IRQ number
    jmp isr_handler

.global irq146
.type irq146, @function
.align 8

irq146:
    push $0 // Error code
    push $146 // IRQ number
    jmp isr_handler

.global irq147
.type irq147, @function
.align 8

irq147:
    push $0 // Error code
    push $147 // IRQ number
    jmp isr_handler

.global irq148
.type irq148, @function
.align 8

irq148:
    push $0 // Error code
    push $148 // IRQ number
    jmp isr_handler

.global irq149
.type irq149, @function
.align 8

irq149:
    push $0 // Error code
    push $149 // IRQ number
    jmp isr_handler

.global irq150
.type irq150, @function
.align 8

irq150:
    push $0 // Error code
    push $150 // IRQ number
    jmp isr_handler

.global irq151
.type irq151, @function
.align 8

irq151:
    push $0 // Error code
    push $151 // IRQ number
    jmp isr_handler

.global irq152
.type irq152, @function
.align 8

irq152:
    push $0 // Error code
    push $152 // IRQ number
    jmp isr_handler

.global irq153
.type irq153, @function
.align 8

irq153:
    push $0 // Error code
    push $153 // IRQ number
    jmp isr_handler

.global irq154
.type irq154, @function
.align 8

irq154:
    push $0 // Error code
    push $154 // IRQ number
    jmp isr_handler

.global irq155
.type irq155, @function
.align 8

irq155:
    push $0 // Error code
    push $155 // IRQ number
    jmp isr_handler

.global irq156
.type irq156, @function
.align 8

irq156:
    push $0 // Error code
    push $156 // IRQ number
    jmp isr_handler

.global irq157
.type irq157, @function
.align 8

irq157:
    push $0 // Error code
    push $157 // IRQ number
    jmp isr_handler

.global irq158
.type irq158, @function
.align 8

irq158:
    push $0 // Error code
    push $158 // IRQ number
    jmp isr_handler

.global irq159
.type irq159, @function
.align 8

irq159:
    push $0 // Error code
    push $159 // IRQ number
    jmp isr_handler

.global irq160
.type irq160, @function
.align 8

irq160:
    push $0 // Error code
    push $160 // IRQ number
    jmp isr_handler

.global irq161
.type irq161, @function
.align 8

irq161:
    push $0 // Error code
    push $161 // IRQ number
    jmp isr_handler

.global irq162
.type irq162, @function
.align 8

irq162:
    push $0 // Error code
    push $162 // IRQ number
    jmp isr_handler

.global irq163
.type irq163, @function
.align 8

irq163:
    push $0 // Error code
    push $163 // IRQ number
    jmp isr_handler

.global irq164
.type irq164, @function
.align 8

irq164:
    push $0 // Error code
    push $164 // IRQ number
    jmp isr_handler

.global irq165
.type irq165, @function
.align 8

irq165:
    push $0 // Error code
    push $165 // IRQ number
    jmp isr_handler

.global irq166
.type irq166, @function
.align 8

irq166:
    push $0 // Error code
    push $166 // IRQ number
    jmp isr_handler

.global irq167
.type irq167, @function
.align 8

irq167:
    push $0 // Error code
    push $167 // IRQ number
    jmp isr_handler

.global irq168
.type irq168, @function
.align 8

irq168:
    push $0 // Error code
    push $168 // IRQ number
    jmp isr_handler

.global irq169
.type irq169, @function
.align 8

irq169:
    push $0 // Error code
    push $169 // IRQ number
    jmp isr_handler

.global irq170
.type irq170, @function
.align 8

irq170:
    push $0 // Error code
    push $170 // IRQ number
    jmp isr_handler

.global irq171
.type irq171, @function
.align 8

irq171:
    push $0 // Error code
    push $171 // IRQ number
    jmp isr_handler

.global irq172
.type irq172, @function
.align 8

irq172:
    push $0 // Error code
    push $172 // IRQ number
    jmp isr_handler

.global irq173
.type irq173, @function
.align 8

irq173:
    push $0 // Error code
    push $173 // IRQ number
    jmp isr_handler

.global irq174
.type irq174, @function
.align 8

irq174:
    push $0 // Error code
    push $174 // IRQ number
    jmp isr_handler

.global irq175
.type irq175, @function
.align 8

irq175:
    push $0 // Error code
    push $175 // IRQ number
    jmp isr_handler

.global irq176
.type irq176, @function
.align 8

irq176:
    push $0 // Error code
    push $176 // IRQ number
    jmp isr_handler

.global irq177
.type irq177, @function
.align 8

irq177:
    push $0 // Error code
    push $177 // IRQ number
    jmp isr_handler

.global irq178
.type irq178, @function
.align 8

irq178:
    push $0 // Error code
    push $178 // IRQ number
    jmp isr_handler

.global irq179
.type irq179, @function
.align 8

irq179:
    push $0 // Error code
    push $179 // IRQ number
    jmp isr_handler

.global irq180
.type irq180, @function
.align 8

irq180:
    push $0 // Error code
    push $180 // IRQ number
    jmp isr_handler

.global irq181
.type irq181, @function
.align 8

irq181:
    push $0 // Error code
    push $181 // IRQ number
    jmp isr_handler

.global irq182
.type irq182, @function
.align 8

irq182:
    push $0 // Error code
    push $182 // IRQ number
    jmp isr_handler

.global irq183
.type irq183, @function
.align 8

irq183:
    push $0 // Error code
    push $183 // IRQ number
    jmp isr_handler

.global irq184
.type irq184, @function
.align 8

irq184:
    push $0 // Error code
    push $184 // IRQ number
    jmp isr_handler

.global irq185
.type irq185, @function
.align 8

irq185:
    push $0 // Error code
    push $185 // IRQ number
    jmp isr_handler

.global irq186
.type irq186, @function
.align 8

irq186:
    push $0 // Error code
    push $186 // IRQ number
    jmp isr_handler

.global irq187
.type irq187, @function
.align 8

irq187:
    push $0 // Error code
    push $187 // IRQ number
    jmp isr_handler

.global irq188
.type irq188, @function
.align 8

irq188:
    push $0 // Error code
    push $188 // IRQ number
    jmp isr_handler

.global irq189
.type irq189, @function
.align 8

irq189:
    push $0 // Error code
    push $189 // IRQ number
    jmp isr_handler

.global irq190
.type irq190, @function
.align 8

irq190:
    push $0 // Error code
    push $190 // IRQ number
    jmp isr_handler

.global irq191
.type irq191, @function
.align 8

irq191:
    push $0 // Error code
    push $191 // IRQ number
    jmp isr_handler

.global irq192
.type irq192, @function
.align 8

irq192:
    push $0 // Error code
    push $192 // IRQ number
    jmp isr_handler

.global irq193
.type irq193, @function
.align 8

irq193:
    push $0 // Error code
    push $193 // IRQ number
    jmp isr_handler

.global irq194
.type irq194, @function
.align 8

irq194:
    push $0 // Error code
    push $194 // IRQ number
    jmp isr_handler

.global irq195
.type irq195, @function
.align 8

irq195:
    push $0 // Error code
    push $195 // IRQ number
    jmp isr_handler

.global irq196
.type irq196, @function
.align 8

irq196:
    push $0 // Error code
    push $196 // IRQ number
    jmp isr_handler

.global irq197
.type irq197, @function
.align 8

irq197:
    push $0 // Error code
    push $197 // IRQ number
    jmp isr_handler

.global irq198
.type irq198, @function
.align 8

irq198:
    push $0 // Error code
    push $198 // IRQ number
    jmp isr_handler

.global irq199
.type irq199, @function
.align 8

irq199:
    push $0 // Error code
    push $199 // IRQ number
    jmp isr_handler

.global irq200
.type irq200, @function
.align 8

irq200:
    push $0 // Error code
    push $200 // IRQ number
    jmp isr_handler

.global irq201
.type irq201, @function
.align 8

irq201:
    push $0 // Error code
    push $201 // IRQ number
    jmp isr_handler

.global irq202
.type irq202, @function
.align 8

irq202:
    push $0 // Error code
    push $202 // IRQ number
    jmp isr_handler

.global irq203
.type irq203, @function
.align 8

irq203:
    push $0 // Error code
    push $203 // IRQ number
    jmp isr_handler

.global irq204
.type irq204, @function
.align 8

irq204:
    push $0 // Error code
    push $204 // IRQ number
    jmp isr_handler

.global irq205
.type irq205, @function
.align 8

irq205:
    push $0 // Error code
    push $205 // IRQ number
    jmp isr_handler

.global irq206
.type irq206, @function
.align 8

irq206:
    push $0 // Error code
    push $206 // IRQ number
    jmp isr_handler

.global irq207
.type irq207, @function
.align 8

irq207:
    push $0 // Error code
    push $207 // IRQ number
    jmp isr_handler

.global irq208
.type irq208, @function
.align 8

irq208:
    push $0 // Error code
    push $208 // IRQ number
    jmp isr_handler

.global irq209
.type irq209, @function
.align 8

irq209:
    push $0 // Error code
    push $209 // IRQ number
    jmp isr_handler

.global irq210
.type irq210, @function
.align 8

irq210:
    push $0 // Error code
    push $210 // IRQ number
    jmp isr_handler

.global irq211
.type irq211, @function
.align 8

irq211:
    push $0 // Error code
    push $211 // IRQ number
    jmp isr_handler

.global irq212
.type irq212, @function
.align 8

irq212:
    push $0 // Error code
    push $212 // IRQ number
    jmp isr_handler

.global irq213
.type irq213, @function
.align 8

irq213:
    push $0 // Error code
    push $213 // IRQ number
    jmp isr_handler

.global irq214
.type irq214, @function
.align 8

irq214:
    push $0 // Error code
    push $214 // IRQ number
    jmp isr_handler

.global irq215
.type irq215, @function
.align 8

irq215:
    push $0 // Error code
    push $215 // IRQ number
    jmp isr_handler

.global irq216
.type irq216, @function
.align 8

irq216:
    push $0 // Error code
    push $216 // IRQ number
    jmp isr_handler

.global irq217
.type irq217, @function
.align 8

irq217:
    push $0 // Error code
    push $217 // IRQ number
    jmp isr_handler

.global irq218
.type irq218, @function
.align 8

irq218:
    push $0 // Error code
    push $218 // IRQ number
    jmp isr_handler

.global irq219
.type irq219, @function
.align 8

irq219:
    push $0 // Error code
    push $219 // IRQ number
    jmp isr_handler

.global irq220
.type irq220, @function
.align 8

irq220:
    push $0 // Error code
    push $220 // IRQ number
    jmp isr_handler

.global irq221
.type irq221, @function
.align 8

irq221:
    push $0 // Error code
    push $221 // IRQ number
    jmp isr_handler

.global irq222
.type irq222, @function
.align 8

irq222:
    push $0 // Error code
    push $222 // IRQ number
    jmp isr_handler

.global irq223
.type irq223, @function
.align 8

irq223:
    push $0 // Error code
    push $223 // IRQ number
    jmp isr_handler

.global irq224
.type irq224, @function
.align 8

irq224:
    push $0 // Error code
    push $224 // IRQ number
    jmp isr_handler

.global irq225
.type irq225, @function
.align 8

irq225:
    push $0 // Error code
    push $225 // IRQ number
    jmp isr_handler

.global irq226
.type irq226, @function
.align 8

irq226:
    push $0 // Error code
    push $226 // IRQ number
    jmp isr_handler

.global irq227
.type irq227, @function
.align 8

irq227:
    push $0 // Error code
    push $227 // IRQ number
    jmp isr_handler

.global irq228
.type irq228, @function
.align 8

irq228:
    push $0 // Error code
    push $228 // IRQ number
    jmp isr_handler

.global irq229
.type irq229, @function
.align 8

irq229:
    push $0 // Error code
    push $229 // IRQ number
    jmp isr_handler

.global irq230
.type irq230, @function
.align 8

irq230:
    push $0 // Error code
    push $230 // IRQ number
    jmp isr_handler

.global irq231
.type irq231, @function
.align 8

irq231:
    push $0 // Error code
    push $231 // IRQ number
    jmp isr_handler

.global irq232
.type irq232, @function
.align 8

irq232:
    push $0 // Error code
    push $232 // IRQ number
    jmp isr_handler

.global irq233
.type irq233, @function
.align 8

irq233:
    push $0 // Error code
    push $233 // IRQ number
    jmp isr_handler

.global irq234
.type irq234, @function
.align 8

irq234:
    push $0 // Error code
    push $234 // IRQ number
    jmp isr_handler

.global irq235
.type irq235, @function
.align 8

irq235:
    push $0 // Error code
    push $235 // IRQ number
    jmp isr_handler

.global irq236
.type irq236, @function
.align 8

irq236:
    push $0 // Error code
    push $236 // IRQ number
    jmp isr_handler

.global irq237
.type irq237, @function
.align 8

irq237:
    push $0 // Error code
    push $237 // IRQ number
    jmp isr_handler

.global irq238
.type irq238, @function
.align 8

irq238:
    push $0 // Error code
    push $238 // IRQ number
    jmp isr_handler

.global irq239
.type irq239, @function
.align 8

irq239:
    push $0 // Error code
    push $239 // IRQ number
    jmp isr_handler

.global irq240
.type irq240, @function
.align 8

irq240:
    push $0 // Error code
    push $240 // IRQ number
    jmp isr_handler

.global irq241
.type irq241, @function
.align 8

irq241:
    push $0 // Error code
    push $241 // IRQ number
    jmp isr_handler

.global irq242
.type irq242, @function
.align 8

irq242:
    push $0 // Error code
    push $242 // IRQ number
    jmp isr_handler

.global irq243
.type irq243, @function
.align 8

irq243:
    push $0 // Error code
    push $243 // IRQ number
    jmp isr_handler

.global irq244
.type irq244, @function
.align 8

irq244:
    push $0 // Error code
    push $244 // IRQ number
    jmp isr_handler

.global irq245
.type irq245, @function
.align 8

irq245:
    push $0 // Error code
    push $245 // IRQ number
    jmp isr_handler

.global irq246
.type irq246, @function
.align 8

irq246:
    push $0 // Error code
    push $246 // IRQ number
    jmp isr_handler

.global irq247
.type irq247, @function
.align 8

irq247:
    push $0 // Error code
    push $247 // IRQ number
    jmp isr_handler

.global irq248
.type irq248, @function
.align 8

irq248:
    push $0 // Error code
    push $248 // IRQ number
    jmp isr_handler

.global irq249
.type irq249, @function
.align 8

irq249:
    push $0 // Error code
    push $249 // IRQ number
    jmp isr_handler

.global irq250
.type irq250, @function
.align 8

irq250:
    push $0 // Error code
    push $250 // IRQ number
    jmp isr_handler

.global irq251
.type irq251, @function
.align 8

irq251:
    push $0 // Error code
    push $251 // IRQ number
    jmp isr_handler

.global irq252
.type irq252, @function
.align 8

irq252:
    push $0 // Error code
    push $252 // IRQ number
    jmp isr_handler

.global irq253
.type irq253, @function
.align 8

irq253:
    push $0 // Error code
    push $253 // IRQ number
    jmp isr_handler

.global irq254
.type irq254, @function
.align 8

irq254:
    push $0 // Error code
    push $254 // IRQ number
    jmp isr_handler

.global irq255
.type irq255, @function
.align 8

irq255:
    push $0 // Error code
    push $255 // IRQ number
    jmp isr_handler

.align 8

isr_handler:
    // We must preserve state so saving registers is important
    push %rax
    push %rcx
    push %rdx
    push %rbx
    push %rbp
    push %rsi
    push %rdi
    push %r8
    push %r9
    push %r10
    push %r11
    push %r12
    push %r13
    push %r14
    push %r15

    // Pass the stack pointer to RDI to make our interrupt handler's argument a pointer to the registers + IRQ + error code
    mov %rsp, %rdi
    call interruptHandler

    pop %r15
    pop %r14
    pop %r13
    pop %r12
    pop %r11
    pop %r10
    pop %r9
    pop %r8
    pop %rdi
    pop %rsi
    pop %rbp
    pop %rbx
    pop %rdx
    pop %rcx
    pop %rax

    add $16, %rsp // Remove the error code and IRQ from the stack
    iretq
