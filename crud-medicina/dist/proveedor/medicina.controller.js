"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MedicinaController = void 0;
const common_1 = require("@nestjs/common");
const medicina_service_1 = require("./medicina.service");
const create_medicina_dto_1 = require("./create-medicina.dto");
const update_medicina_dto_1 = require("./update-medicina.dto");
let MedicinaController = class MedicinaController {
    constructor(MedicinaService) {
        this.MedicinaService = MedicinaService;
    }
    findAll() {
        return this.MedicinaService.findAll();
    }
    create(createMedicinaDto) {
        return this.MedicinaService.create(createMedicinaDto);
    }
    update(id, updateMedicinaDto) {
        return this.MedicinaService.update(id, updateMedicinaDto);
    }
    remove(id) {
        return this.MedicinaService.remove(id);
    }
};
exports.MedicinaController = MedicinaController;
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], MedicinaController.prototype, "findAll", null);
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_medicina_dto_1.CreateMedicinaDto]),
    __metadata("design:returntype", Promise)
], MedicinaController.prototype, "create", null);
__decorate([
    (0, common_1.Put)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, update_medicina_dto_1.UpdateMedicinaDto]),
    __metadata("design:returntype", Promise)
], MedicinaController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], MedicinaController.prototype, "remove", null);
exports.MedicinaController = MedicinaController = __decorate([
    (0, common_1.Controller)('medicinas'),
    __metadata("design:paramtypes", [medicina_service_1.MedicinaService])
], MedicinaController);
//# sourceMappingURL=medicina.controller.js.map