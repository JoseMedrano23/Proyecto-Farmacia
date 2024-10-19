"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MedicinaModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const medicina_entity_1 = require("./entities/medicina.entity");
const medicina_service_1 = require("./medicina.service");
const medicina_controller_1 = require("./medicina.controller");
let MedicinaModule = class MedicinaModule {
};
exports.MedicinaModule = MedicinaModule;
exports.MedicinaModule = MedicinaModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([medicina_entity_1.Medicina])],
        controllers: [medicina_controller_1.MedicinaController],
        providers: [medicina_service_1.MedicinaService],
    })
], MedicinaModule);
//# sourceMappingURL=medicina.module.js.map